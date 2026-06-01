import re
import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


class AuthGateStaticTests(unittest.TestCase):
    def read(self, relative_path):
        return (REPO_ROOT / relative_path).read_text(encoding="utf-8")

    def test_running_apps_use_shared_login_gate(self):
        for app in [
            "第四章 SingleSample/ui.R",
            "第五章 CompareTest/ui.R",
            "第六章 SampleSize/ui.R",
        ]:
            with self.subTest(app=app):
                ui = self.read(app)
                self.assertIn('source("../tab/tab_cn_causal.R"', ui)
                self.assertIn("checkLogin()", ui)

    def test_login_gate_does_not_default_open(self):
        for helper in ["tab/tab_cn_causal.R", "tab/tab_cn.R"]:
            with self.subTest(helper=helper):
                content = self.read(helper)
                self.assertIn("let loginFlag = false;", content)
                self.assertNotRegex(
                    content,
                    r"let\s+loginFlag\s*=\s*false\s*;\s*loginFlag\s*=\s*true\s*;",
                )

    def test_malformed_cookie_cannot_skip_redirect(self):
        for helper in ["tab/tab_cn_causal.R", "tab/tab_cn.R"]:
            with self.subTest(helper=helper):
                content = self.read(helper)
                self.assertIn("try {", content)
                self.assertIn("} catch (e) {", content)
                self.assertRegex(
                    content,
                    re.compile(
                        r"typeof\s+userObj\['eMail'\]\s*===\s*'string'.*"
                        r"loginFlag\s*=\s*true",
                        re.DOTALL,
                    ),
                )


if __name__ == "__main__":
    unittest.main()
