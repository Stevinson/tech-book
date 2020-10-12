# Python Concepts

## Mixins

A *mixin* is a special kind of multiple inheritance which is mainly used in one of the following two cases: 

1. You want to provide a lot of optional features to a class.
1. You want to use one particular feature in a lot of different classes,

Essentially they encapsulate behaviour that can be reused in other classes. The difference from a parent class is that a mixim is independent enough. They are not generally used on their own but are not abstract classes either.

## Testing

### Monkey Patching

This is the dynamic replacement of attributes at runtime. This means you can replace a method that has external dependencies with a stub that returns some fixed data.

### Fixturees

Reusable code that is used to inject a test.

```
@pytest.fixture
```

### Mocks


### Dunder Methods

1. `__set_name__(self, owner, name)`

This can be used to access the variable name programatically.

2. `__get__(se;f, isntance, owner)`

This can be used to tell a manager class what other **instance** it is responsible for.

3. `__repr__(self)`

Returns the object representation.

4. `__class__()`

Descriptor object.

5. `__name__(self)`

6. `__mro__()`

method resolution order. A tuple of the class and all it's base classes, in order of inheritence.

7. `__get_attribute__(self, name)`

