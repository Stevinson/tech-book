# Conda

* `conda config --append channels conda-forge` : conda-forge is a good place to start when packages are not available at the standard channels.

* To use a local package in conda instead of installing one:

```
conda install conda-build
conda-develop <path to repo> # From the main repo
```

And then to use the packaged module again:

```
conda-develop -u <path to repo>
poetry install # to re-install the pipeline
```


