import awesome


def test_something():
    assert awesome.smile() == ':)'


def test_fib():
    assert awesome.fib(1) == 1


def test_fib_second():
    assert awesome.fib(3) == 3
    assert awesome.fib(5) == 8


def test_something_wrong():
    assert awesome.smile() != 1


def test_another():
    assert awesome.k('2') == '22'
