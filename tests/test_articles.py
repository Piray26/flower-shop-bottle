import unittest
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from articles import validate_author, validate_date


class TestArticleValidation(unittest.TestCase):

    def test_valid_author_cyrillic(self):
        self.assertTrue(validate_author('Анна_Петрова'))

    def test_invalid_author_too_short(self):
        self.assertFalse(validate_author('A'))

    def test_valid_date(self):
        self.assertTrue(validate_date('2026-05-28'))

    def test_invalid_date_format(self):
        self.assertFalse(validate_date('28.05.2026'))


if __name__ == '__main__':
    unittest.main()
