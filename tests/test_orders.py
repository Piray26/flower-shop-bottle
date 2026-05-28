import unittest
import os
import sys

# Эта строка нужна, чтобы Python мог найти файл orders.py при запуске тестов
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from orders import validate_phone, validate_date

class TestOrderValidation(unittest.TestCase):

    def test_valid_phone(self):
        """Тест: корректный номер телефона"""
        self.assertTrue(validate_phone('+7(999)-123-45-67'))

    def test_invalid_phone_no_plus(self):
        """Тест: номер без плюса в начале"""
        self.assertFalse(validate_phone('8(999)-123-45-67'))

    def test_invalid_phone_spaces(self):
        """Тест: номер с пробелами вместо дефисов"""
        self.assertFalse(validate_phone('+7 999 123 45 67'))

    def test_valid_date(self):
        """Тест: корректная дата в формате ГГГГ-ММ-ДД"""
        self.assertTrue(validate_date('2026-05-28'))

    def test_invalid_date_slash(self):
        """Тест: дата через слэш (неверный формат)"""
        self.assertFalse(validate_date('28/05/2026'))

    def test_invalid_date_dot(self):
        """Тест: дата через точку (неверный формат)"""
        self.assertFalse(validate_date('28.05.2026'))

if __name__ == '__main__':
    unittest.main()