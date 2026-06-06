import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


def app_dir(suffix):
    return next(path for path in REPO_ROOT.iterdir() if path.is_dir() and path.name.endswith(suffix))


def read_text(path):
    return path.read_text(encoding="utf-8")


class StaticWiringTests(unittest.TestCase):
    def test_login_gate_fails_closed(self):
        text = read_text(REPO_ROOT / "tab" / "tab_cn_causal.R")

        self.assertIn("let loginFlag = false;", text)
        self.assertNotIn("loginFlag = true;\n            if(userVal != '')", text)
        self.assertIn("try {", text)
        self.assertIn("catch (e)", text)
        self.assertIn("if(!loginFlag)", text)

    def test_comparetest_registers_each_module_once(self):
        server_text = read_text(app_dir("CompareTest") / "server.R")

        self.assertEqual(
            server_text.count('mod_server_3_continuous_paired("mod3_continuous_paired")'),
            1,
        )
        self.assertEqual(
            server_text.count('mod_server_3_ordinal_paired("mod3_ordinal_paired")'),
            1,
        )

    def test_comparetest_binary_results_are_rendered(self):
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
            self.assertIn(f'output${output_name}', mod_server)
            self.assertIn(f'ns("{output_name}")', mod_ui)

        for missing_key in (
            "PPV_Leisenring",
            "NPV_Leisenring",
            "PPV_Pepe",
            "NPV_Pepe",
        ):
            self.assertNotIn(f"result${missing_key}\n", mod_server)
            self.assertIn(f"result${missing_key}_result", mod_server)

    def test_cluster_matrix_submit_requires_generated_inputs(self):
        text = read_text(app_dir("SingleSample") / "mod_server_10.R")

        self.assertIn("generated_dims <- reactiveVal(NULL)", text)
        self.assertIn("generated_dims(list(I = I, K = K))", text)
        self.assertIn('need(!is.null(dims), "请先生成输入框")', text)
        self.assertIn("更改分级数或类别数后请重新生成输入框", text)
        self.assertIn("cell_value <- input[[paste0(\"cell_\", i, \"_\", j)]]", text)
        self.assertIn('need(!is.null(cell_value), "请先生成输入框")', text)

    def test_roc_estimation_failure_does_not_return_unbound_plot(self):
        text = read_text(app_dir("SingleSample") / "mod_server_11.R")

        self.assertIn("params <- NULL", text)
        self.assertIn("plot_result <- NULL", text)
        self.assertIn('need(!is.null(params), "参数估计失败，请检查输入数据")', text)
        self.assertIn("req(result$plot_result)", text)
        self.assertIn("req(result$params)", text)


if __name__ == "__main__":
    unittest.main()
