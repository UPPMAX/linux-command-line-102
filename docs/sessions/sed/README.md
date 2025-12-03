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

## Commonly used regular expression meta characters

- **caret (^)** matches the beginning of the line.
- **dollar sign ($)** matches the end of the line.
- **asterisk (*)** matches zero or more occurrences of the previous character.
- **plus (+)** matches one or more occurrence(s) of the previous character.
- **question mark (?)** matches zero or one occurrence of the previous character.
- **dot (.)** matches exactly one character.

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

