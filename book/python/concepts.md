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


