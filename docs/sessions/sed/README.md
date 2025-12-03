---
tags:
  - session
  - lesson
  - sed
  - regular expressions
  - stream editor
---

# Replacing using regular expressions and `sed`

???- note "Need a video?"

    ...

!!! info "Learning outcomes"

    - Learners can use `sed`
    - Learners have practiced using the `sed` manual
    - Learners can use `sed` to replace text
    - Learners can send text to `sed` using a pipe
    - (optional) Learners have seen the flexibility of `sed`

???- note "For teachers"

    Lesson plan:

    Time         |Minutes|Duration|Description
    -------------|-------|--------|---------
    11:20-10:30  |0-10   |10      |Prior
    11:30-10:35  |10-15  |5       |Present
    11:35-10:55  |15-35  |20      |Challenge
    11:55-12:09  |35-45  |10      |Feedback and conclusion

    Prior:

    - How to replace text with `grep`?
    - In Linux, which two types of documentation are
      available from the command line?
    - What is `sed`?
    - `sed` is a stream editor. What would that mean?
    - `sed` is a stream editor that can filter text. What would that mean?
    - `sed` is a stream editor that can transform text. What would that mean?

## Why use `sed`?

`sed` is among
[the list of 'Portable Operating System Interface' (POSIX) commands](https://en.wikipedia.org/wiki/List_of_POSIX_commands),
which means it is considered a fundamental tool
and is likely to be available on your operating system.

`sed` can do what `grep` can do` and more:
it can **replace** text that is found by regular expression matches.


## `sed` can do what `grep` can do`

`sed` can do what `grep` can do`.
For example, in the session about `grep`, we used the following command:

```bash
man grep | grep "^[A-Z]"
```

The equivalent `sed` command is this:

```bash
man grep | sed --quiet "/^[A-Z]/p"
```

???- question "Are there synonyms for this `sed` command?"

    Yes, these commands are all equivalent:

    ```bash
    man grep | sed --quiet "/^[A-Z]/p"
    man grep | sed --silent "/^[A-Z]/p"
    man grep | sed -n "/^[A-Z]/p"
    ```

## How `sed` works


- [`sed` documentation, section '6.1 How `sed` Works'](https://www.gnu.org/software/sed/manual/sed.html#Execution-Cycle)


## Exercises

## Exercise 1: use the `sed` manual

In this exercise, we'll use the `sed` manual.

---

### Exercise 1.1: view the `sed` manual

View the `sed` manual.

??? tip "The command to view a manual"

    `man` is the command to view a manual

??? tip "Answer"

    In the terminal, type:

    ```bash
    sed grep
    ```

    Use the arrow keys to navigate and `q` to quit

---

### Exercise 1.2.1: what is `sed`, definition 1?

According to the `sed` manual, **in a one-liner**, what is `sed`?

Tip: it is at the top.

??? tip "Answer"

    `sed` is a 'stream editor for filtering and transforming text'.

    It is in the fourth line:

    ```console
    SED(1)                                User Commands                                SED(1)

    NAME
           sed - stream editor for filtering and transforming text
    ```


### Exercise 1.2.2: what is `sed`, definition 2?

According to the online `sed` manual at
[https://www.gnu.org/software/sed/](https://www.gnu.org/software/sed/),
what is `sed`? What does that definition mean?


??? tip "Answer"

    At [https://www.gnu.org/software/sed/](https://www.gnu.org/software/sed/)
    the first line reads:

    > `sed` is 'a non-interactive command-line text editor

    It means that you can let `sed` work on your file (like you
    do with e.g. `nano`) without you opening the file.

---

### Exercise 1.3: view the `sed` info page

View the `sed` info page.

??? tip "The command to view an info page"

    `info` is the command to view an info page.

??? tip "Answer"

    In the terminal, type:

    ```bash
    info grep
    ```

    Use the arrow keys to navigate and `q` to quit

---

## Exercise x: `sed` can do all `grep` can do


  


## Exercise x: use `sed` to replace text from standard input

## Exercise x: use `sed` to replace text from a file

## Exercise x: use `sed` to replace text in a file







# sed

The command ``sed`` (stream editor) is one of the most powerful commands. It is used for textual processing - parsing and transforming text. It uses a simple, but compact programming language.

After the programming language AWK was developed, ``sed`` and ``awk`` are often used together, particularly in scripts. Together they are commonly considered progenitors and inspiration for Perl.

## Syntax

```bash
sed [options] 'command' [inputfile...]
```

where

- **options** are optional flags that modify the behavior of the sed command
- **command** is a command or sequence of commands to execute on the inputfile(s)
- **inputfile** is one or more inputfiles that is to be processed

## Common ``sed`` options

- **-i** - Edit the file in place without printing to the console (overwrite the file).
- **-n** - Suppress automatic printing of lines.
- **-e** - Allows multiple commands to be executed.
- **-f** - Reads ``sed`` commands from a file instead of the command line.
- **-r** - Enables extended regular expressions.

Some examples inspired by:

- <https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/>
- <https://en.wikipedia.org/wiki/Sed>

## Substitution command

This is probably what ``sed`` is most commonly used for: substitution. It is also the original motivation for creating it.

**Syntax**

```bash
sed 's/regexp/replacement/g' inputFileName > outputFileName
```

- **regexp** is a regular expression (pattern) to be searched, including a text.
- **replacement** is what should be replaced for the matched patterns - literal text or format string the characters ``&`` for "entire match" or the special escape sequences ``\1`` through ``\9`` for the nth saved sub-expression.
- **inputFileName** is the file(s) to be searched
- **outputFileName** is the name(s) of the changed files - if not given the changed content is just shown on screen.

**s** stands for substitute, **g** for global (all instances), and **/** is the conventional delimiting symbol used.

### Examples

!!! note "Replace all instances of 'cat' with 'ferret' and send to screen"

    Use the file "file1.txt" in "exercises -> "sed"

    ```bash
    sed 's/cat/ferret/g' file1.txt
    ```

!!! note "Replace all instances of 'cat' with 'ferret' and write to a file"

    Use the file "file1.txt" in "exercises -> "sed"

    ```bash
    sed 's/cat/ferret/g' file1.txt > output.txt
    ```

!!! note "Replace the nth occurrence of a pattern in a line"

    Let us change the 3rd occurrence in the same line of word to book in file3.txt

    ```bash
    sed 's/word/book/3' file3.txt
    ```

!!! note "Replace occurrences from n and the rest of the way"

    Here from 3rd occurrence

    ```bash
    sed 's/word/book/3g' file3.txt
    ```

!!! note "Replace only the occurrence of a string on a specific line"

    This for line 3

    ```bash
    sed '3 s/word/book/' file3.txt
    ```

!!! note "Put a parentheses around the first character of each word"

    ```bash
    echo "Hello I am learning more Linux" | sed 's/\(\b[A-Z]\)/\(\1\)/g'
    ```

!!! note "Replace all instances of 'cat' or 'dog' with 'cats' or 'dogs' - do not duplicate existing plurals"

    Use all files named starting with "file" in the "exercises" -> "sed" folder (but not subdirs). Here the changed text is just thrown to screen.

    ```bash
    sed -r "s/(cat|dog)s?/\1s/g" file*
    ```

    - (cat|dog) is the 1st (and only) saved sub-expression in the regexp, and \1 in the format string substitutes this into the output.
    - You can see in the output that i.e. "dogs" did not get turned into "dogss"
    - However, it did not catch things were for instance "cat" is in the middle of a word, like "located" which did get changed to "locatsed"
    - This could be fixed with ``sed -r "s/(' cat '|dog)s?/\1s/g" file*``

## Other common commands

Besides substitution, ``sed`` can do many other things. There are around 25 ``sed`` commands. Here we will only look at the command to filter out specific lines.

### Using the ``d`` command to filter out specific lines

!!! note "filter lines that only contain spaces, or only contain the end of line character"

    ```bash
    sed '/^ *$/d' inputFile
    ```

!!! note "Deleting a specific line from a specific file"

    Delete line 4

    ```bash
    sed '4d' file1.txt
    ```

!!! note "Delete a line containing a matching pattern"

    Lines matching the string "cat"

    ```bash
    sed '/cat/d' file1.txt
    ```

## Filtering

It is also common to use ``sed`` as a filter, as part of a "pipeline".

In this example, the program "data-generating-program" is creating some data, but you named something wrong perhaps, and now you need to replace all instances of "right" with "left":

```bash
data-generating-program | sed 's/right/left/g'
```

## In-place editing

Using the ``-i`` option allows "in-place" editing instead of creating a new file with the editions (though in reality a temporary file is created in the background and then the original file is replaced by the temporary file).

**Example - change cat to dog**

```bash
sed -i 's/cat/dog/' file1.txt
```

## Summary

!!! note "Keypoints"

    - we have learned about ``sed`` and some of its common commands
    - we have used ``sed`` to replace strings matching a pattern
    - we have used ``sed`` to delete specific lines
    - we have learned about ``sed`` for filtering
    - we have learned about ``sed`` in-place editing

