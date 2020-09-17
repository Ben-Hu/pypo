import sys


def hello(name):
    name = name.strip()
    assert name != ""
    return f"Hello {name}"


if len(sys.argv) > 1:
    name = sys.argv[1]
else:
    name = sys.stdin.readline()

result = hello(name)
print(result)
