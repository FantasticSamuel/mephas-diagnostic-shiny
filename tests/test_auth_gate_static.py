import re
import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
AUTH_HELPER = REPO_ROOT / "tab" / "tab_cn_causal.R"


class AuthGateStaticTest(unittest.TestCase):
    def test_login_flag_is_not_forced_before_cookie_validation(self):
        source = AUTH_HELPER.read_text(encoding="utf-8")
        login_start = source.index("let loginFlag = false;")
        cookie_check = source.index("if(userVal != '')", login_start)
        pre_cookie_validation = source[login_start:cookie_check]

        # Ignore JavaScript comments embedded in the R string, so a documented
        # debug shortcut cannot fail the test unless it is actually executed.
        uncommented = re.sub(r"//.*", "", pre_cookie_validation)

        self.assertNotRegex(uncommented, r"\bloginFlag\s*=\s*true\s*;")

    def test_missing_login_still_redirects_to_login_page(self):
        source = AUTH_HELPER.read_text(encoding="utf-8")

        self.assertIn("if(!loginFlag)", source)
        self.assertIn("backend/page/login/login.html", source)


if __name__ == "__main__":
    unittest.main()
