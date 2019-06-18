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

* `{` and `}` : jump backward or forward by a paragraph.

* `w` and `b` to jump forward and backwards a word at a time.

* `i` : jumps the to the end of the current word.

* `{` and `}` : jump backward or forward by a paragraph.

* `u` undo's the last action

* `ctlr` + `r` : redo the last action

* `/search_term` and then `n` to find the next occurance and `N` to find the previous

* `:3` goes to line 3

* `:split <filename>` : split view into two views

* `ctlr` + `w` : split between files when in spkit mode

* `#*` : searches for the next instance of the word under the cursor

* `s` : deletes the character under the cursor and enters insert mode

* `yw` : copy the word under the cursor as long as the cursor is over the first letter

* `yy` : copy the whole line

* `p` : prints the copied word

* `G` : move cursor to the last line of the file but stay in insert mode

* `x` : deletes the character under the cursor

* `X` : deletes the character before the cursor

* `df<letter>` : deletes from the cursor to the first occurance of the specified letter

* `<number>dw` : deletes a specified number of words (cursor has to be at beginning of the word)

* `cw` : i.e. create word - delets the word and enters insert mode

* `:%s/fff/rrrrr/g` - For all lines in a file, find string "fff" and replace with string "rrrrr" for each instance on a line

* `:PluginInstall` : used to turn on the Vundle extensions

* `5dd` : will delete the next 5 lines.

* `:sp <file_path>` : enters splitscreen horizontally

* `vd <file_path>` : enters splitscreen vertically

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

* **Vundle** is a VIM extension manager, to be thought of as the pip for VIM.
