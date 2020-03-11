# Testing

## pytest

### Fixtures

To create a mock class, create a fixture with a class defined within it and return an instance of that class.


### Mark

The `pytest.mark`  helper allows you to set metadata o nyour test functions. 

The builtins:

*  `skip`
* `skipif`
* `xfail`
* `parametrize`

Setting the `pytestmark = pytest.mark.django_db` will use to mark a test function as requiring the database. It will ensure the database is set up correctly for the test. Each test will run in its own transaction which will be rolled back at the end of the test. 
### Other

To make an assert statement that prints when not evaluated to True:

```python
assert (
	variable
), f"Variable was {variable}"
```

## Helpers

* `caplog` and `capsys` can be used to make asserts against what is added to logs or to syserr or sysout. These are invoked by adding `capsys` or `caplog` to the last argument of the test function.

## Helpers

* `caplog` and `capsys` can be used to make asserts against what is added to logs or to syserr or sysout. These are invoked by adding `capsys` or `caplog` to the last argument of the test function. The assert is then called with: `assert "string" in caplogs.text`

## Factories

The `factory` package can be used to create factories.

To create Django factories the factory class should inherit from `factory.DjangoModelFactory`.

* `@factory.post_generation` an be used to call a method on every construction of an object via a factory. Then to set these you need to call the factory with an argument in the syntax `method_name__method_argument=<value>`. Note to set the `create` value to `None` you have to `.build()` the object (as opposed to `.create()`-ing it).


## MonkeyPatch

* Use `monkeypatch.setitem()` to patch the dictionary for the test. 

* `monkeypatch.delitem()` can be used to remove items.

*  Use monkeypatch.setenv("PATH", value, prepend=os.pathsep) to modify $PATH, and monkeypatch.chdir() to change the context of the current working directory during a test.

* 
