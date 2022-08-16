def fib(n):
    if n < 0:
        return 0
    if n <= 1:
        return 1
    return fib(n - 1) + fib(n - 2)


def untested_code(a):
    print("Some")
    raise Exception()
