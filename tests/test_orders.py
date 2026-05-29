import unittest
import os
import sys

sys.path.insert(
    0,
    os.path.dirname(os.path.abspath(__file__))
)

from orders import (
    validate_phone,
    validate_date
)


class TestOrderValidation(unittest.TestCase):


    def test_valid_phone_plus7(self):
        """Корректный номер +7"""
        self.assertTrue(
            validate_phone('+7(999)-123-45-67')
        )

    def test_valid_phone_8(self):
        """Корректный номер через 8"""
        self.assertTrue(
            validate_phone('89991234567')
        )

    def test_valid_phone_7(self):
        """Корректный номер через 7"""
        self.assertTrue(
            validate_phone('79991234567')
        )

    def test_invalid_phone_no_plus(self):
        """Номер без +"""
        self.assertFalse(
            validate_phone('8(999)-123-45-67')
        )

    def test_invalid_phone_spaces(self):
        """Номер с пробелами"""
        self.assertFalse(
            validate_phone('+7 999 123 45 67')
        )

    def test_invalid_phone_letters(self):
        """Телефон содержит буквы"""
        self.assertFalse(
            validate_phone('+7(999)-ABC-DE-FG')
        )

    def test_invalid_phone_short(self):
        """Слишком короткий номер"""
        self.assertFalse(
            validate_phone('12345')
        )

    def test_invalid_phone_long(self):
        """Слишком длинный номер"""
        self.assertFalse(
            validate_phone('899912345678999')
        )

    def test_invalid_phone_empty(self):
        """Пустой номер"""
        self.assertFalse(
            validate_phone('')
        )

    def test_invalid_phone_symbols(self):
        """Телефон с лишними символами"""
        self.assertFalse(
            validate_phone('+7(999)@123-45-67')
        )


    def test_valid_date(self):
        """Корректная дата"""
        self.assertTrue(
            validate_date('2026-05-28')
        )

    def test_valid_leap_year(self):
        """29 февраля високосного года"""
        self.assertTrue(
            validate_date('2024-02-29')
        )

    def test_invalid_leap_year(self):
        """29 февраля невисокосного года"""
        self.assertFalse(
            validate_date('2023-02-29')
        )

    def test_invalid_date_slash(self):
        """Дата через /"""
        self.assertFalse(
            validate_date('28/05/2026')
        )

    def test_invalid_date_dot(self):
        """Дата через ."""
        self.assertFalse(
            validate_date('28.05.2026')
        )

    def test_invalid_date_text(self):
        """Текст вместо даты"""
        self.assertFalse(
            validate_date('hello')
        )

    def test_invalid_date_empty(self):
        """Пустая дата"""
        self.assertFalse(
            validate_date('')
        )

    def test_invalid_month(self):
        """Месяц > 12"""
        self.assertFalse(
            validate_date('2025-13-10')
        )

    def test_invalid_day(self):
        """День > 31"""
        self.assertFalse(
            validate_date('2025-12-32')
        )

    def test_invalid_date_format(self):
        """Неверный формат"""
        self.assertFalse(
            validate_date('05-28-2026')
        )


if __name__ == '__main__':
    unittest.main()