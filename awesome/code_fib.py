def fib(n):
    if n < 0:
        return 1
    if n <= 1:
        return 1
    return fib(n - 1) + fib(n - 2)


def untested_code(a):
    raise Exception()
