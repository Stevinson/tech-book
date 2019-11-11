# Other Commands

Technologies that only have a few commands notes have been bunched together here.

## Atom

* `Shift` + `Cmmd` + `M`
  This gives a markdown viewer so you can see the formatting of your markdown code.

---

## Eclipse

### Class Paths

* The PATH environment variable is a series of directories in which Windows looks fro programs. It allows you to be able to conveniently run the executables from any directory without having to type the full path of the command.

* N.B. Windows accepts both `/` and `\` as folder separators within a path, and works just as well within `PATH`.

* N.B. Windows treats consecutive folder separators as one logical separator, i.e. `C:\FOLDER\\` == `C:\FOLDER\`

* To check is `PATH` already contains a pathm we need a way to convert any given path into a canonical form, due to the reasons above (and further syntax points). To do this the `~s` modifier is used to remove enclosing quotes. We use `FINSTR` regular expressions to classify a path as wither qualified or relative. A normal qualified path must start with `<letter>:<separator>`, whilst a UTC path always starts `<letter>:<separator>`.

* The **Uniform Naming Convention** (UNC) Path defines the location of a resourse on a network. it works on a network level rather than an operating system level, and so has to have a global standard.

* **Mapped drives** are specific to certain computers.

### Commands


---

## IntelliJ

* `cmmd` + `backspace` : deletes the line the cursor is on.

* `cmmd` + `fn` + `left`: go to top of file

### To debug a server

1. `wlp/bin ./server debug <server_name>`
2. Look for 'Attach to process' and select the relevent option

---

## DB2

### Error Messages

204 - Missing column

---

### bash and zsh

* `source`
* `.`
  The above two commands are the same except source always searches the current directory first before the rest on the $PATH.

* `bash` and `exit`
  Enters and then leaves bash.

* `PS1='\W# '`
  Use this to change what information appears in the terminal prompt.









---

The following to be out in order when I have time:

* To return the shell that you are using:

```
echo $SHELL
```

`-e`: Enable interpretation of backslash escape sequences





- source activate iaml
  source deactivate iaml
  Use this to activate the vm (for Edinburgh ML project)
- mv <oldname> <newname>

 Change the name of a directory

- conda info -e

 See what anaconda virtual environment I am in

- unzip file.zip -d <destination_folder>

 Unzip to a specific folder







Jenkins

- agent
  - docker
  -

Gradle

Notes

The Gradle Wrapper considtd of four files:

- <root>/gradlew
- <root>/gradlew.bat
- <root>/gradle/wrapper/gradle-wrapper.jar
- <root>/gradle/wrapper/gradle-wrapper.properties

…and can be further optimised with...

- <root>/build.gradle

Commands

Ruby

rvm use ruby-2.4.2 —default

Specify a specific version of Ruby to use.



NodeJs





SQL



Notes

tty is a Unix commadn that displays to standard output the name of the terminal connected to standard input. These are commonly used as a way to get access to the computer to fix things without having to log into.

---

## Slack

* `ctrl` + `backtick`

Moves focus to the next section.

* `cmmd` + `K`

Quick switcher.

* `cmmd` + `/`

See a list of all the shortkeys.

---

## Chrome

* `cntrl` + `shift` + `delete`

Delete history.


---

## Liberty

`server` is the command used to action Liberty commands from the command line.

*

```bashrc
server package <server_name> --archive=<package_file_name.zip> --include=all
```

## Maven

To use maven in a session:

1. Set the JAVA_HOME variable:

```
which java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
```

2. Add maven to the path

```
export PATH=/opt/apache-maven-3.5.4/bin:$PATH
```

---

## Poetry

Clear caches:

```
poetry cache:clear --all pypi
poetry cache:clear --all nexus
```

## Pip

```
pip install --index-url https://pypi.python.org/simple <package-name> # This downloads from a specific index instead of the deafult
```

## shred

`shred` overwrites files to hide their contents, adnnn optionally to delte them. It makes them very difficult to recover by a third party. Normally when a file is deleted, that portion of the disk is markes as being ready fir another file to be written to it but the data is still there. shread accomplishes this distruction by overwriting, repeaatedly, the data you want destroyed, replacing it with random data.

* `-u` - delete the file as well as shredding it.

# wget

`wget` is a non-interactive download utility, meaning that it can work in the background or before a user logs in.
