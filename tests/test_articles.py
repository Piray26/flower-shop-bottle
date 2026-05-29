import os
import sys
import unittest
import io

from bottle import FormsDict, default_app

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import app
import articles
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

    def test_article_can_be_submitted_without_phone(self):
        original_load_articles = articles.load_articles
        original_save_articles = articles.save_articles
        body = (
            b'author=%D0%90%D0%BD%D0%BD%D0%B0'
            b'&title=%D0%A1%D1%82%D0%B0%D1%82%D1%8C%D1%8F'
            b'&description=%D0%9F%D0%BE%D0%BB%D0%B5%D0%B7%D0%BD%D0%BE%D0%B5+'
            b'%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5'
            b'&phone='
        )
        environ = {
            'PATH_INFO': '/articles',
            'REQUEST_METHOD': 'POST',
            'SERVER_NAME': 'localhost',
            'SERVER_PORT': '5555',
            'CONTENT_TYPE': 'application/x-www-form-urlencoded; charset=UTF-8',
            'CONTENT_LENGTH': str(len(body)),
            'wsgi.version': (1, 0),
            'wsgi.url_scheme': 'http',
            'wsgi.input': io.BytesIO(body),
            'wsgi.errors': sys.stderr,
            'wsgi.multithread': False,
            'wsgi.multiprocess': False,
            'wsgi.run_once': False,
        }
        status = []
        headers = []

        try:
            articles.load_articles = lambda: []
            articles.save_articles = lambda items: None
            list(default_app()(environ, lambda s, h, e=None: (status.append(s), headers.append(h))))
        finally:
            articles.load_articles = original_load_articles
            articles.save_articles = original_save_articles

        self.assertEqual(status[0], '302 Found')


if __name__ == '__main__':
    unittest.main()
