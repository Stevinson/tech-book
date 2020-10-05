# Torch

## CUDA

This package adds support for CUDA tensor types, that implement the same function as CPU tensors, but they utilize GPUs for computation.

`device = torch.device("cuda" if torch.cuda.is_available() else "cpu")`



## `nn`

`Module` is the base class for all neural network modules.

`Dropout` for dropout regularisation.