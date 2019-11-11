# Makefiles

## `shell` function

This command communicates with the worls outside `make`

It is often used to fetch the valuable for a varible:

```
TAG=$(shell grep 'version = "*"' pyproject.toml | egrep -o '[0-9]+.[0-9]+.[0-9]+')
```
