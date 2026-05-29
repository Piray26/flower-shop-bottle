import os
import sys
import unittest

from bottle import FormsDict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from articles import clean_text, validate_author, validate_phone


class TestArticleValidation(unittest.TestCase):

    def test_clean_text_keeps_normal_cyrillic(self):
        self.assertEqual(clean_text('Анна'), 'Анна')

    def test_clean_text_repairs_mojibake(self):
        self.assertEqual(clean_text('Ð\x90Ð½Ð½Ð°'), 'Анна')

    def test_forms_getunicode_keeps_cyrillic(self):
        form = FormsDict()
        form['author'] = 'Ð\x90Ð½Ð½Ð°'
        self.assertEqual(form.getunicode('author'), 'Анна')

    def test_valid_author_cyrillic(self):
        self.assertTrue(validate_author('Анна_Петрова'))

    def test_invalid_author_too_short(self):
        self.assertFalse(validate_author('A'))

    def test_valid_phone_simple_eight(self):
        self.assertTrue(validate_phone('89123456789'))

    def test_valid_phone_formatted(self):
        self.assertTrue(validate_phone('+7(999)-222-56-89'))

    def test_invalid_phone_with_spaces(self):
        self.assertFalse(validate_phone('+7 999 222 56 89'))


if __name__ == '__main__':
    unittest.main()
