# Terminal Commands

This page summarises common terminal commands that span across categories.

Note that a lot of terminal shortcuts are stored at `/usr/local/beg`, e.g. pip3.

The file `.bashrc` contains the aliases for commands.

## Commands

### General

* `sudo -i`
  Goes into super-administrator mode.
  `exit`
  To exit this admin mode.

* `cat`
  Takes a file and prints it to screen.

* `<command> | pbcopy`
  * This copies the output of command to the clipboard. `pbpaste` will paste the contents of the clipboard.
  * `-pboard {board}` as an argument allows you to use different pasteboards, but I have, as yet, been unable to figure out quite how this works.

* The `|` creates pipelines. This means that the output from the first command is connected to the input of the next command.

* `dscl . list /Users | grep -v “^_”` : lists all the users on the mac

* `sed` - is a stream editor and so can be used for tasks such as searching, replacement or deletion.

### File Management

* `ls -altr`
  * `-a`  - Shows hidden files, i.e. those that start with a .
  * `-l` - Provides extra information
  * `-t` - Lists them in date order
  * `-r` - Lists them with the most recent at the bottom

* `brew cask uninstall <app_name>`

* `brew cask search <app_name>`

* `brew tap <tapame>` allows Homebrew to tap into another repository of formulae meaning that you have more installable software. `brew tap` on its own will list all thw taps available.

* `tee benchmarking-file-{1..1000}.txt < benchmarking-file.txt >/dev/null` - copy a file multiple times

* To find the average size of files in a directory:

```
find -x . -type f -maxdepth 1 -exec sh -c 'stat -f '%z' "${@}"' _ '{}' + |
LC_ALL=C awk -v pwd="${PWD}" '
   BEGIN{ sum=0; count=0; }
   { sum+=$1; ++count; }
   END{
        if (count == 0) exit;
        printf ("number of files: %d\n", count);
        printf ("average file size in B: %.5f\n", sum/count);
        printf ("average file size in KB: %.5f\n", (sum/count) / 1024);
        printf ("average file size in MB: %.5f\n", (sum/count) / (1024*1024));
        printf ("directory: %s\n", pwd);
   }
'
```

* `find` flags:
	* `-L` (and the deprecated `-follow`) means that symbolic links are followed and the information printed to screen will be that of the folder which is pointed to and not the link. 

### Running Processes

* `ps`
  Lists the currently running processes on the computer.
  * `-e` is the same as `-A` and displays information about other users' processes, including those without controlling terminals.
  * `-f` displays the bid, pid, and other information about the processes.
  * For example `ps -ef | grep java` returns a list of all the running processes that are using java.

### Web

* `curl -L <web_page>`
  * curl is a tool to transfer data from or to a server, using one of the supported protocols.
  * The `-L` argument: If  the  server  reports  that  the requested page has moved to a different location (indicated with a Location: header and a 3XX response code), this option will make curl redo the request on the new place.

### Variables:

* `${}`
    Whatever is run inside the parentheses is run inside a subshell and is returned as a value.
    It can be used in a string to add the returned string within a larger string e.g. echo "http://${nodeip}"
  * `$<variable-name>`
    Can be used within a string to add a variable to the string.
  * To print a variable on mac use echo `$HOME`, whilst on windows use echo %PATH% (having set it with set PATH=<value>).
  * `<variable_name>=$(<command_that_returns_value>)`
    This how to set a variable in CLI.

* `cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 256 | head -n 1 | xargs echo -n`
  This generates a 2048-buit secret key. The LC_CTYPE+C command selects the “C” locale, which basically means means “nothing fancy”.

* `env`
  * This is the 'set environment and execute command, or print environment' method.

* `env` prints all env variables
    VCAP_SERVICES environment variables

### Path and File Access

* `ln -s "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`
  Basically you have to put the executable for the app on the path, which you achieve by putting in one of the /usr/local/ things which are themselves on the path.

* `export PATH=$PATH:<~/path>``
  Add a new directory to PATH

* `ln -s <executable> <new_location>`
  Link a file to something; -s created a symbollic link (doesn't mve anything) (sometimes have to save in .) For example, to create a symbolic link to open Sublime Text, use the following command:

* To remove a path from the PATH environment variable on a mac:

```bashrc
echo $PATH // and copy it's value
export PATH=""
export PATH="/path/you/want/to/keep"
```

Or to add a path to the PATH environment variable:

```bashrc
// export PATH=/opt/apache-maven-3.5.3/bin:$PATH
export PATH=/path/want/to/add:$PATH
```

### Repackaging Files

When tar has been used to collect many files into one archive file, it is referred to as a **tarball**.

* `tar -cvzf <name of tarball>.tgz /path/to/source/folder`

This uses tar to archive the directory and then gzip to compress it. The arguments are as follows: compress, zip, verbose and file.

  * `-x, --extract, --get`

            extract files from an archive

  * `-v, --verbose`

            verbosely list files processed

  * `-z, --gzip, --gunzip, --ungzip`

            filter the archive through gzimkdir up

  * `-f, --file [HOSTNAME:]F`

            use archive file or device F (default "-", meaning stdin/stdout)

  * `-C <new_directory_name>`

    In `x` mode this changes the directories after opening the archive but before extracting entries from the archive. In `c` and `r` mode this changes the directory before adding the following files.

  * `-t` : List archive contents to stdout. Prints the absolute path of all the files in the archive.

* `tar -xvzf /path/to/yourfile.tgz` - Extract tgz

* `unzip <zip_file> -d <relative_path>`
    The directory in which to extract the files.

    `zip -r squash.zip dir1`: zips a directory

##### GNU tar

```terminal
brew install gnu-tar            // This installs GNU tar, which packages files differently.

gtar <>
```
  * `-c` : Create a new archive. Directories are archived recursively, unless the `--no-recursion` argument is used.

  * `-f` : Read the archive from from a specified file

  * `-z` :

* `tar -cvf files.tar /path/to/file0 /path/to/file1 ; gzip -9 files.tar`
  This first TARs the file and then gzips it.
  .Z file type is an old Unix/ Linux compression type, achieved with the $compress command.

#### `pax`

This is for reading and writing file archives and copying directory hierarchies

#### Permissions

* The different permission are as follows:
  * r = read access
  * w = write access
  * x = execute
  * d = indicates a directory
  * l = symbolic link
  * @ = indicates that this file has extended attributes

* `chmod`
  chmod [options] [permissions] [file] [name]
  Used to change the permissions of files or directories. It stands for 'change mode'.

* `ls -l`
This displays (from left to right) the owner's permissions, the group permissions and everybody's permissions.

* `sudo chmod 777 <filepath>`
This gives access to everyone, but is bad practice.;


#### Bash

* `source ./.bashrc`

This reloads the `bashrc` file so that you don't have to close vim and terminal, and hence Eclipse.

#### Publish an i2 component

```Bash
mkdir publish

mv macos*tar.gz publish

components publish "External/IBM JDK 8 Darwin Binary Distribution:8.0.5.5" /copy_to_repository /export_fs:$PWD/publish /retraction:deprecate /retract_at:+6m
```

#### Searching within Terminal

* `find . | wc -l`: Count the number of files in a directory

* `find . | grep <search_term>`
  This searches for a search term within the name of the all the files in the current directory and lower.

* `grep [OPTIONS] PATTERN [FILE...]`
  grep which stands for global regular expression print, processes text line by line and prints any lines which match a specified pattern.

	* `-w` argument searches for the search term as a stand-alone word (i.e. does not match partials)

* `egrep`

	* `-o` argument ("--only-matching") prints only the matching part of the lines

* `which <file_name>``
  This locates a file on the path.

* `<command> $PATH`
  Lists all the places terminal has looked for the command which <command>where is the program installed

* `ls -l | grep <search term>`

* `ctrl` + `R` : search history of commands

#### iTerm

* `cmmd` + `option` + `/`
  Gives a drop down of the most commonly used terminals.

* `cmmd` + `D`
  Splits the current tab into two panes vertically.

#### File manipulation and inspection

* `sed 's/FindThisWord/ReplaceWithThisWord/g' file.txt`
  You can replace all the instances of a word in a file with the use of this command.

* `fold [-bs] [-w width] [file ...]`
  This is a filter that folds the contents of the specified files, breaking the lines to have a maximum of 80 columns.

* `jar tf <jar_name>`
  Displays the contents of a jar.


## Servers

* `ssh -i S-Eng_key.pem ubuntu@10.11.97.174` : connect to a remote server

* Create a file called `config` in the `.ssh` directory. In this one can create aliases to scp and ssh in the following format: 
  ```
  Host section-pipeline
  HostName 10.11.97.174
  User ubuntu
  Port 22
  IdentityFile
  ```

## Other

* `stdout` seems to be a holder for the standard location to put output, but I do not know any more than this. Apparently opening the file `/dev/stdout` is equivalent to the following call: `fd = fcntl(STDOUT_FILENO, F_DUPFD, 0)`

- xargs [command [initial-arguments]]
  xargs builds and executes command lines from standard input. It reads items from the standard input, delimited by blanks (which can be protected with double or single quotes or a backslash) or newlines, and executes the command (the default command is echo, located at /bin/echo) one or more times with any initial-arguments followed by items read from standard input. Blank lines on the standard input are ignored.


- head [-#] <file_name>
  Prints out the first # of lines of the stated file.

- rm -Rf <directory>
  This deletes all the contents of a directory without having to type yes to each sub-directory.

  `find . -name '*filepattern' -delete`

  This deletes all files in this (and all recursive directories!) whose name matches the patter.

  - tr [-Ccsu] string1 string2

  This utility copies the standard input to the standartd output, substituting or deleting selected characters.



  - cat [-benstuv] [file ...]

  The cat utility reads files sequentially, writing them to the standard output.


* `open`
  * `-e` Opens the file with TextEdit.

## Shortkeys

* `cmmd` + `down`

Opens a the highlighted file in Finder.

* `cmmd` + `up`

Traverses to the above direcory in Finder.


## Other

* On a windows the command to move a file is not `mv` but `move`

### shebang

e.g. `#!/bin/sh` is an example of a shebang, which tells the parent shell which interpreter should be used to execute the script.

### Redirection

`>` is for redirecting an output file-descriptor and `>` is for redirecting an input file-descriptor. What this means is that the output of a command can be written to a file with the command `ls -l > output.txt`.

`>>` on the other hand appends to a file or creates the file if it does not exist.

`&` is an indicator that the following number is a file descriptor (i.e. 1 = stdin, 2 = stderr) as opposed to a file name.

### Synchronising files

`rsync`: see common usages [here](https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/).

## Open file dynamically

Opens file that updates

`less +F <file_oath_to_log>

## Disk Space

* `df` - Lists disk space on mounted disks
	* `-h` - human readable format
	* `--total` - return a total as well

* `du` - Lists the memory usage of files and directories
	* `-h` - in human readable format
	* `-c <directory_name>` - to view the total for a directory

## Subshell

`(list)`, where list is a sequence of commands: the list executes in a subshell environment. Note that variable assignments and builtin commands that affect the shell's environment fo not remain in effect after the command completes.

`python -m pip install pygame --index-url https://pypi.python.org/simple` to set the default url to pypi (instead of eigen)`
