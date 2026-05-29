import os
import sys
import unittest

from bottle import FormsDict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from articles import clean_text, validate_author, validate_date


class TestArticleValidation(unittest.TestCase):

    def test_clean_text_keeps_normal_cyrillic(self):
        self.assertEqual(clean_text('Анна'), 'Анна')

    def test_forms_getunicode_keeps_cyrillic(self):
        form = FormsDict()
        form['author'] = 'Ð\x90Ð½Ð½Ð°'
        self.assertEqual(form.getunicode('author'), 'Анна')

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
