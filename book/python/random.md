# Random

## Flatten a list of lists

```python
import itertools

s = list(itertools.chain(*sentences))
```

## Progress bar on loops

Use `tqdm`

## Fore named arguments

A bare `*` is used to force the caller to use named arguments - so you cannot define a function with `*` as an argument when you have no following keyword arguments.