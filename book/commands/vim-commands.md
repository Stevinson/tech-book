# Vim

## About

.vimrc contains customisations.

## Commands

### Insert Mode Commands

* `:version`
  Displays all the files that vim is using.

* `:echo $MYVIMRC`
  Prints the location of the .vimrc file.

* `I` - insert at the beginning of the line

* `A` - insert at the end of a line

* `ZZ` - Quits Vim.

* `D` - Deletes the whole current line.

* `ctrl` + `n` - autocomplete for key words.

### Non-Insert Node Commands

* `u` - undo

* `ctrl` + `r` - redo

* `ctrl` + `n` - switch between relative and absolute line numbering.

* `[relative line number]` + `j` - jumps to the relative line number forward

* `[relative line number]` + `k` - jumps to the relative line number backward

* `shift` + `arrows`
  Moves the cursor to the next or previous word

* Search:
  - /<search_patterm> : searches forward
  - /<search_pattern> : searches backwards
  - `n` : repeat forward search
  - `N` : repeat backwards search
  - `*` : search for the word currently under the cursor
  - `:%s/search_for_this/replace_with_this/c` : search and replace with confirm.

* `saveas <filename>`
  Creates a new file with the given name in the current folder.

* `gg`
  This will move the cursor to the beginning of the file. Note that it will not appear on the screen, which took me a little by surprise.

* `dG`
  This will delete the whole file.

* `dd`
  This will delete the line under the cursor.

* `yy`

Similarly, to copy five lines in vim, use the yank command again, but precede it with the number 5:

### Vim-Latex Commands

* `:ver` - Check the version

*  `\rf` - Folds all the sections in the file up.

*

### Other

I downloaded pathogen. This means that any plugins you wish to install can be extracted to a subdirectory under ~/.vim/bundle, and they will be added to the 'runtimepath'. Observe:

```bash
cd ~/.vim/bundle && \
git clone https://github.com/tpope/vim-sensible.git
```
Now sensible.vim is installed.
