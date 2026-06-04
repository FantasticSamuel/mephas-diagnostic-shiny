from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]


def read(relative_path):
    return (ROOT / relative_path).read_text(encoding="utf-8")


class StaticWiringTests(unittest.TestCase):
    def test_comparetest_loads_shinymatrix_with_quoted_package_name(self):
        ui = read("第五章 CompareTest/ui.R")

        self.assertIn('requireNamespace("shinyMatrix", quietly = TRUE)', ui)
        self.assertIn('install.packages("shinyMatrix")', ui)
        self.assertIn('library("shinyMatrix")', ui)
        self.assertNotIn("require(shinyMatrix)", ui)
        self.assertNotIn("install.packages(shinyMatrix)", ui)

    def test_comparetest_paired_modules_are_registered_once(self):
        server = read("第五章 CompareTest/server.R")

        self.assertEqual(
            1,
            server.count('mod_server_3_continuous_paired("mod3_continuous_paired")'),
        )
        self.assertEqual(
            1,
            server.count('mod_server_3_ordinal_paired("mod3_ordinal_paired")'),
        )

    def test_comparetest_binary_tab_outputs_use_computed_result_keys(self):
        server = read("第五章 CompareTest/mod_server_1.R")
        ui = read("第五章 CompareTest/mod_ui_1.R")

        self.assertIn('verbatimTextOutput(ns("SeSp_result"))', ui)
        for key in (
            "PPV_Leisenring_result",
            "NPV_Leisenring_result",
            "PPV_Pepe_result",
            "NPV_Pepe_result",
        ):
            self.assertRegex(server, rf"result\${re.escape(key)}\b")

        self.assertNotRegex(server, r"result\$(PPV_Leisenring|NPV_Leisenring|PPV_Pepe|NPV_Pepe)\b(?!_result)")

    def test_samplesize_server_loads_samplesize_package(self):
        server = read("第六章 SampleSize/server.R")

        self.assertIn("library(SAMPLESIZE)", server)
        self.assertNotIn("library(SINGLESAMPLE)", server)


if __name__ == "__main__":
    unittest.main()
