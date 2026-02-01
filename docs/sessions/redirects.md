<!-- markdownlint-disable MD013 --><!-- Let's break the 80 characters per line -->
<!-- markdownlint-disable MD009 --><!-- Let's stop checking for trailing spaces -->
# Redirects

I/O redirection: Usually, standard input comes from the keyboard etc. and the standard output goes to the screen. There is also standard error. All of these can be redirected with Linux commands.

!!! note "Objectives"

    - Learn about redirection
        - standard input
        - standard output
        - standard error

When running a command which can take input, give output, or do both, redirection lets us *redirect* the input and output to any files or folders we want to. It is also possible to redirect any errors specifically, instead of together with regular output, so you get errors and other output to different files.

As default, **standard output** and **standard error** are sent to the screen and **standard input** comes from the keyboard/mouse.

![overview](../images/redirect-overview.png)

**Example**: You run a command, for instance ``ls``; it throws the output to the screen. However, if you want to save it to a file instead you could use **output redirection**.

Redirects are particularly useful if we are working with large outputs/inputs, multiple outputs/inputs, or wish to save the output for later.

It may also be that we want to use the output from one command as input for another command - this can be solved with **pipes** as we saw yesterday, but saving the intermittent result to file is also an option.

There are different types of redirection:

- overwrite redirection
- append redirection
- merge redirection

Let us look at them one at a time and see some examples.

## Overwrite redirection

Let us assume you want to save the output of a command to a file and that you do not mind that the existing content of that file is overwritten (or you create a new file). In this situation, **overwrite redirection** is useful.

- **>** - standard output
- **<** - standard input

!!! note

    Whenever a new program is run, the **kernel** creates a table of file descriptors for the program.

    File descriptors are pointers to files.

    By convention, the first 3 entries in the table (descriptors 0, 1, and 2) are used as standard input (stdin), standard output (stdout), and standard error (stderr).

    The full syntax of the redirection operator includes an optional file descriptor:

    - ``command > file`` could be written ``command 1> file``
    - ``command < file`` could be written ``command 0< file``

    **Redirecting stdout to file**

    ![redirect stdout](../images/redirect-stdout.png)

    The stderr still goes to screen. 

    **Redirecting stderr to file**

    ![Redirect stdout](../images/redirect-stderr.png)

### Examples

!!! hint

    Code along!

    The files used in the examples are either created during the examples or can be found in the directory "exercises" -> "redirects-env-link".

**Output of ls to file mylsoutput.txt**

```bash
ls > mylsoutput.txt
```

**Anything written after ">" is written to myfile.txt - end with CTRL-D**

```bash
bbrydsoe@enterprise:~$ cat > myfile.txt
This text will go to the file myfile.txt
bbrydsoe@enterprise:~$
```

**This gives the input of "myfile.txt" to cat, which prints the content to screen**

```bash
cat < myfile.txt
```

**Splitting standard error and standard output - send standard error to file "error-log"**

```bash
./myprogram 2> error.log
```

It will tell you (in error.log) that there is no such file or directory. Try instead running it with the program ``imagefind.sh``. It will put a different message in the ``error.log`` file.

## Append redirection

It is also possible to append to a file with redirection, instead of overwriting. This is done with:

- **>>** - standard output
- **<<** - standard input

### Examples

!!! hint

    Code along!

    The files used in the examples are either created during the examples or can be found in the directory "exercises" -> "redirects-env-link".

**Add more text to an existing file**

```bash
echo 'text to append_add_here' >> myfile.txt
```

**Another way to add more text to an existing file**

```bash
printf "text to append\n" >> myfile.txt
```

**Append one existing file to another**

```bash
cat file1.txt >> file2.txt
```

Take a look inside ``file2.txt`` and see that the content of ``file1.txt`` has been added.

**Append one existing file to another and also throw the content of the file being added to screen**

```bash
cat file1.txt 0>> file2.txt
```

### What about standard input, << ?

A common way to use ``<<`` is to let a program know what the ending text is (use it as a delimiter).

For instance, the program reads everything you gives to the program as input until it sees the delimiter. Then it performs its tasks on it.

**Example - count lines/words/characters on several lines of input**

```bash
$ wc << EOF
> Here are some words
> More words
> Yet more words
> It is just one more line
> EOF
      4      15      71
```

## Merge redirection

With merge redirection you can redirect the output of a command or a program to a file descriptor instead of to standard output.

**Syntax**

- ``stream1 >& stream2`` - merge output from stream1 with stream2
- ``stream1 <& stream2`` - merge input from stream1 with stream2

!!! note "Remember"

    - file descriptor 0: standard input
    - file descriptor 1: standard output
    - file descriptor 2: standard error

So, sometimes you want to write more than one output stream to the same file. Commonly, standard output and standard error. This could be done like this:

- ``command > file 2>&1``

This is the same as that but longer, but maybe more descriptive:

    - ``command 1> file 2>&1``

![Redirect stdout and stderr](../images/redirect-stderr-stdout.png)

### Examples

**Example: Send both standard output and standard error to file "mylog.log"**

```bash
./myprogram.sh > mylog.log 2>&1
```

It should throw some errors and also some output to a file ``mylog.log``.

2>&1 means that "standard error" (STDERR) are redirected to whatever the target is of "standard output" (STDOUT).

What happens more precisely is that the error message that is generated by "standard error"/"2" gets merged with the "standard output"/"1".

## Exercise

1. Use "overwrite redirection" to send standard output of ``ls -lart`` of the directory "exercises" -> "redirects-env-link" to a file named "myfiles-list.txt"
2. Use "append redirection" and ``echo`` to add a line of text to one of the files in the directory "exercises" -> "redirects-env-link".
3. Use "merge redirection" and "pipe" as well as any commands you want to generate some output and errors and throw them to the same file.

## Summary

!!! note "keypoints"

    - We learned about redirection
        - overwrite
        - append
        - merge

