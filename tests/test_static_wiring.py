import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


def app_dir(suffix):
    return next(path for path in REPO_ROOT.iterdir() if path.is_dir() and path.name.endswith(suffix))


def read_text(path):
    return path.read_text(encoding="utf-8")


class StaticWiringTests(unittest.TestCase):
    def test_login_gate_is_not_forced_open(self):
        text = read_text(REPO_ROOT / "tab" / "tab_cn_causal.R")

        self.assertNotIn("loginFlag = true;\n            if(userVal != '')", text)
        self.assertIn("let loginFlag = false;", text)
        self.assertIn("try {", text)
        self.assertIn("catch (e)", text)
        self.assertIn("if(!loginFlag)", text)

    def test_comparetest_startup_wiring(self):
        compare_test = app_dir("CompareTest")
        ui_text = read_text(compare_test / "ui.R")
        server_text = read_text(compare_test / "server.R")

        self.assertIn('require("shinyMatrix")', ui_text)
        self.assertIn('install.packages("shinyMatrix")', ui_text)
        self.assertEqual(
            server_text.count('mod_server_3_continuous_paired("mod3_continuous_paired")'),
            1,
        )
        self.assertEqual(
            server_text.count('mod_server_3_ordinal_paired("mod3_ordinal_paired")'),
            1,
        )

    def test_samplesize_server_loads_samplesize_package(self):
        sample_size = app_dir("SampleSize")
        server_text = read_text(sample_size / "server.R")

        self.assertIn("library(SAMPLESIZE)", server_text)
        self.assertNotIn("library(SINGLESAMPLE)", server_text)

    def test_comparetest_results_are_rendered(self):
        compare_test = app_dir("CompareTest")
        mod_server = read_text(compare_test / "mod_server_1.R")
        mod_ui = read_text(compare_test / "mod_ui_1.R")

        for output_name in (
            "SeSp_result",
            "PPV_Leisenring_result",
            "NPV_Leisenring_result",
            "PPV_Pepe_result",
            "NPV_Pepe_result",
        ):
            self.assertIn(output_name, mod_server)
            self.assertIn(f'ns("{output_name}")', mod_ui)
            self.assertNotIn(f"result${output_name.removesuffix('_result')}\n", mod_server)

    def test_dynamic_matrix_modules_require_generated_inputs(self):
        single_sample = app_dir("SingleSample")
        compare_test = app_dir("CompareTest")

        for module_path in (
            single_sample / "mod_server_10.R",
            compare_test / "mod_server_13.R",
        ):
            text = read_text(module_path)
            self.assertIn("generated_dims <- reactiveVal(NULL)", text)
            self.assertIn("need(!is.null(dims), \"请先生成输入框\")", text)
            self.assertIn("更改分级数或类别数后请重新生成输入框", text)

    def test_comparetest_mod8_computes_only_after_run(self):
        compare_test = app_dir("CompareTest")
        text = read_text(compare_test / "mod_server_8.R")

        self.assertEqual(text.count("Y <- eventReactive(input$run"), 4)
        self.assertEqual(text.count("req(result)"), 4)


if __name__ == "__main__":
    unittest.main()
