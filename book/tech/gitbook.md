# Gitbook

## Updated

The below instructions are outdated. Rather use the following:

```
npm install gitbook-cli -g
```

```
gitbook init ./<directory-name>
```

Then:

```Bash
gitbook serve
# or
gitbook build
```

When a new plugin is put into the `book.json` file then you need to run:

```
gitbook install
```

### Publish to Pages

To publish a gitbook to Github Pages you need to create a branch called `gh-pages`.

This can be achieved with the following shell script:

```
# install the plugins and build the static site
gitbook install && gitbook build

# checkout to the gh-pages branch
git checkout gh-pages

# pull the latest updates
git pull origin gh-pages --rebase

# copy the static site files into the current directory.
cp -R _book/* .

# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update docs"

# push to the origin
git push origin gh-pages

# checkout to the master branch
git checkout master
```

Whenever this script is run it will generate files for the static website and push the `gh-pages` branch.

The website is now available at `http(s)://<username>.github.io/<projectname`.
