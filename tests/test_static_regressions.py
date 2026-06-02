import re
import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


def read_text(relative_path):
    return (REPO_ROOT / relative_path).read_text(encoding="utf-8")


class StaticRegressionTests(unittest.TestCase):
    def test_comparetest_shiny_matrix_package_name_is_quoted(self):
        ui = read_text("第五章 CompareTest/ui.R")

        self.assertIn('require("shinyMatrix")', ui)
        self.assertIn('install.packages("shinyMatrix")', ui)
        self.assertNotIn("require(shinyMatrix)", ui)
        self.assertNotIn("install.packages(shinyMatrix)", ui)

    def test_comparetest_binary_outputs_read_stored_result_keys(self):
        server = read_text("第五章 CompareTest/mod_server_1.R")

        for result_name in (
            "PPV_Leisenring_result",
            "NPV_Leisenring_result",
            "PPV_Pepe_result",
            "NPV_Pepe_result",
        ):
            pattern = re.compile(
                r"output\$"
                + re.escape(result_name)
                + r"\s*<-\s*renderPrint\(\{.*?result\$"
                + re.escape(result_name),
                re.DOTALL,
            )
            self.assertRegex(
                server,
                pattern,
                msg=f"{result_name} output should read the stored {result_name} list key",
            )

        self.assertIn('verbatimTextOutput(ns("SeSp_result"))', read_text("第五章 CompareTest/mod_ui_1.R"))

    def test_comparetest_has_single_registration_for_each_module_id(self):
        server = read_text("第五章 CompareTest/server.R")

        for module_id in ("mod3_continuous_paired", "mod3_ordinal_paired"):
            self.assertEqual(
                1,
                server.count(f'{module_id}("{module_id}")'),
                msg=f"{module_id} should be registered exactly once",
            )

    def test_comparetest_paired_continuous_differ_arguments_keep_test_groups_together(self):
        server = read_text("第五章 CompareTest/mod_server_6.R")

        self.assertIn(
            "differ_continuous_paired(data1_no, data1_yes, data2_no, data2_yes, alpha)",
            server,
        )
        self.assertNotIn(
            "differ_continuous_paired(data1_no, data2_no, data1_yes, data2_yes, alpha)",
            server,
        )

    def test_samplesize_server_loads_samplesize_package(self):
        server = read_text("第六章 SampleSize/server.R")
        ui = read_text("第六章 SampleSize/ui.R")

        self.assertIn("library(SAMPLESIZE)", server)
        self.assertNotIn("library(SINGLESAMPLE)", server)
        self.assertIn('require("SAMPLESIZE")', ui)
        self.assertIn('install.packages("SAMPLESIZE")', ui)
        self.assertIn('library("SAMPLESIZE")', ui)

    def test_samplesize_ppv_npv_outputs_include_total_sample_size(self):
        server = read_text("第六章 SampleSize/mod_server_7.R")

        for key in ("N_one", "N_two"):
            self.assertGreaterEqual(server.count(f"res${key}"), 2, f"{key} should be shown for PPV and NPV")

        self.assertIn("总样本量 - 阳性预测值", server)
        self.assertIn("总样本量 - 阴性预测值", server)

    def test_shared_login_gate_is_not_force_enabled(self):
        login = read_text("tab/tab_cn_causal.R")

        self.assertIn("let loginFlag = false;", login)
        self.assertNotIn("loginFlag = true;\n            if(userVal", login)


if __name__ == "__main__":
    unittest.main()
