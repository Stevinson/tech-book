# Elixir

## Concepts

### Processes

In Elixir, all code runs inside processes. Processes are isolated from each other, run concurrent to one another and communicate via message passing.

### Case

`case` allows one to compate a value against many patterns until we find a matching one.

### Modules and Functions

* Several functions are grouped into modules. In order to create these we use the `defmodule` macro.

* Default values are specified with the `\\` syntax. 

* Anonymous functions - i.e. closures, are declared with `fn`. e.g.:

```
fun = fn y -> x + y end
```

* Named functions are declared with `def`, e.g.:

```
def hello(x, y) do
  x + y
end
```

### Pipeline Operator

The pipeline operator `|>` puts the expression on the left as an argument to the method on the right.

### Atoms

A colon indicates a variables is an atom, which is a constant whose value it its name.

-------


## Practical

### Dependencies

The following goes into a `mix.exs` file:

```
def deps do
  [
    {:httpoison, "~> 1.5"}
  ]
end
```

and the run `mix deps.get` from the command line.

