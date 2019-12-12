import awesome
from awesome.code_fib_renamed import fib


def test_something():
    assert awesome.smile() == ':)'


def test_a():
    assert fib(2) == 0


def test_nothing():
    assert True
