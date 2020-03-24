import pytest

import awesome
from awesome.code_fib import fib


def test_something():
    assert awesome.smile() == ':)'


def test_a():
    assert fib(2) == 2


def test_nothing():
    assert True


def test_untested():
    with pytest.raises(Exception):
        awesome.untested_code()
