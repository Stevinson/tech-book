# Bash

## Conditional test

Square brackets are a shorthand notation for performing a conditional test.

## Loops

```
for i in {1..50}:
do printf "Test";
done
```

## Outputting to terminal of file

```
[n]>&word
```

* If `n` is not specified it is 1 (which is the file descriptor), meaning stdout.
* NB. A file descriptor of 2 is stderr.:wq


command > output.txt

The standard output stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, it gets overwritten.

command >> output.txt

The standard output stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, the new data will get appended to the end of the file.

command 2> output.txt

The standard error stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, it gets overwritten.

command 2>> output.txt

The standard error stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, the new data will get appended to the end of the file.

command &> output.txt

Both the standard output and standard error stream will be redirected to the file only, nothing will be visible in the terminal. If the file already exists, it gets overwritten.

command &>> output.txt

Both the standard output and standard error stream will be redirected to the file only, nothing will be visible in the terminal. If the file already exists, the new data will get appended to the end of the file..

command | tee output.txt

The standard output stream will be copied to the file, it will still be visible in the terminal. If the file already exists, it gets overwritten.

command | tee -a output.txt

The standard output stream will be copied to the file, it will still be visible in the terminal. If the file already exists, the new data will get appended to the end of the file.

Bash has no shorthand syntax that allows piping only StdErr to a second command, which would be needed here in combination with tee again to complete the table. If you really need something like that, please look at "How to pipe stderr, and not stdout?" on Stack Overflow for some ways how this can be done e.g. by swapping streams or using process substitution.

command |& tee output.txt

Both the standard output and standard error streams will be copied to the file while still being visible in the terminal. If the file already exists, it gets overwritten.

command |& tee -a output.txt

Both the standard output and standard error streams will be copied to the file while still being visible in the terminal. If the file already exists, the new data will get appended to the end of the file.

## Curly Braces

Curly braces places the output of all the commands in them to the output, instead of just the last command.

## Arrays

`Array[@]` will return all the elements in the array, space separated.

To create a list use parentheses with a space between the elements, i.e. `(elem1 elem2)`

## Conditionals

`[[ ]]` is a command that returns a boolean and thus is used for conditionals in bash.

* `-gt` is greater than

* `-d FILE` conditional on whether a directory exists

## Arguments

* `$@`: returns all the arguments, space separated.

* `$#`: return the number of arguments 

* `shift`: the currect positional parameters are shifted n (or 1 if no number provided) to the left. 

## Case statements

```
case $1 in 
	-e|--eigentools)
		# Do something
		;;
	-c|--check)
		# Do somethign else
		;;
	*)
		# Do something if case statement invalid
		;;
esac
```

## Special Variables

* `$?` - give the exit status of the last task
