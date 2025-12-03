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

`sed` (short for 'stream editor')
can do what `grep` can do` and more:
it is 'a non-interactive command-line text editor'
([source](https://www.gnu.org/software/sed/))

In this session, we will be manipulating a file from `sed` (instead of
doing so by hand).

## Overview

![Mindmap](mindmap.png)

## Types of operations

### Filtering

`sed` can do what `grep` can do`.
For example, in the session about`grep`,
we used the following command:

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

    In this session, `--quiet` is used, as it is felt to be 
    the most self-explanatory: to me, 'quiet' feels that it may
    not be perfectly 'silent'.

### Replacing

Probably the most used feature of `sed` is its replacement
functionality:

```bash
sed 's/[regular_expression]/[replacement]/'
```

The `s` is short for 'substitute'. For example, the command
below substitutes 'morning' for 'afternoon'.

```bash
echo "Good morning" | sed 's/morning/afternoon/'
```

???- question "What is the output of that command?"

    ```
    Good afternoon
    ```

If there may be multiple matches in a sentence, add `g` at the end:

```bash
echo "Good morning, good morning" | sed 's/morning/afternoon/g'
```

???- question "What is the output of that command (with the `g`)?"

    ```bash
    Good afternoon, good afternoon
    ```

???- question "What is the output of that command without the `g`?"

    ```bash
    Good afternoon, good morning
    ```


### Deleting

Another commonly used feature of `sed` is its line deletion
functionality:

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

`sed` command                     |Description
----------------------------------|--------------------------------------------------------------------
`cat my_file.txt | sed '1d'`      |Delete the first line
`cat my_file.txt | sed '1,3d'`    |Delete lines 1 to and including 3
`cat my_file.txt | sed '1,3;7,9d'`|Delete lines 1 to (and including) 3 and lines 7 to (and including) 9

<!-- markdownlint-enable MD013 -->

## Input and output

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

`sed` command                                           |Input and output
--------------------------------------------------------|---------------------------------------------------
`cat my_input_file.txt | sed '1d'`                      |Get input from a pipe, write output to terminal
`cat my_input_file.txt | sed '1d' > my_output_file.txt` |Get input from a pipe, write output to another file
`sed '1d' my_input_file.txt`                            |Get input from a file, write output to terminal
`sed '1d' my_input_file.txt > my_output_file.txt`       |Get input from a file, write output to another file
`sed --in-place '1d' my_file.txt`                       |:warning: Modify the file directly

<!-- markdownlint-enable MD013 -->

## Type of regular expressions

There are two types of regular expressions
present in `sed`
[according the `sed` manual](https://www.gnu.org/software/sed/manual/sed.html#Regular-Expressions-Overview):
basic and extended regular expressions.

Here is a quote from
[the `sed` manual](https://www.gnu.org/software/sed/manual/sed.html#BRE-vs-ERE)
regarding their differences:

> In GNU sed, the only difference between basic and extended regular
> expressions is in the behavior of a few special characters:
> `?`, `+`, parentheses, braces (`{}`), and `|`.

The difference can be shown using this text:

```text
Bland
England
Gland
Holland
```

To select the countries, use:

```bash
cat lands.txt | sed --quiet '/[A-Z][a-z][a-z]*land/p'
cat lands.txt | sed --quiet --regexp-extended '/[A-Z][a-z]+land/p'
```


## Exercises

## Exercise 1

!!! info "Macbeth"

    ![Macbeth](macbeth_small.jpg)

    > [source](https://pixabay.com/illustrations/william-shakespeare-macbeth-poster-67764/)

In this exercise, we will work Macbeth, a tale written by William Shakespeare.

In these exercises, we will:

- Remove the copyright:
  it will be more pleasant to read
- Replace 'Weird Sisters' by 'witches':
  the text will be more clear
- Replace all country names by 'Sweden' (or your favorite country):
  the text may be funnier to read :-)

---

## Exercise 1.1: download Macbeth

Download the file from a terminal as such:

<!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

```bash
wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/sessions/sed/macbeth.txt
```

<!-- markdownlint-enable MD013 -->

---

## Exercise 1.2: use `sed` to replace text from standard input

Read [the 'Replacing' section](#replacing).

In Macbeth, replace `Weird Sisters` (both words start with an upper-case
character) by `witches`. Do so by using `cat` on the file `macbeth.txt`,
then piping it to `sed`.

???- question "Answer"

    Here is how to show the text of Macbeth, with the text replaced:

    ```bash
    cat macbeth.txt | sed 's/Weird Sisters/witches/'
    ```

    There is no need to end with a `g`, as doing so (see command below) gives
    identical results:

    ```bash
    cat macbeth.txt | sed 's/Weird Sisters/witches/g'
    ```

    You can check in many ways that `Weird Sisters` only occurs once per
    line. For example, the command below gives no matches:

    ```bash
    cat macbeth.txt | grep "Weird Sisters.*Weird Sisters"
    ```

Check that your replacement worked.

???- tip "Tip"

    Pipe the output to `grep` to detect matches with `witches`

???- question "Answer"

    ```bash
    cat macbeth.txt | sed 's/Weird Sisters/witches/g' | grep witches
    ```

    This gives the output:

    ```
    The witches, hand in hand,
    title, before, these witches saluted me, and referred me to the
    I dreamt last night of the three witches:
    (And betimes I will) to the witches:
    Saw you the witches?
    ```

???- question "How to save to a file?"

    You can redirect the output to a file using `>`, e.g.:

    ```bash
    cat macbeth.txt | sed 's/Weird Sisters/witches/g' > macbeth_with_witches.txt
    ```

---

## Exercise 1.3: use `sed` to find text from standard input

Read [the 'Replacing' section](#replacing).

In Macbeth, there are many place names ending on `land`.

Search for all place names ending on `land` using `sed`.
To be precise, search for all matches that:

- (1) start with an uppercase character
- (2) have zero or more lowercase characters
- (3) end on `land`

Do so by using `cat` on the file `macbeth.txt`,
then piping it to `sed`.

???- question "Answer"

    ```bash
    cat macbeth.txt | sed --quiet '/[A-Z][a-z]*land/p'
    ```

---

## Exercise 1.4: use extended regular expressions

Reading your answer in the previous exercise,
your non-Swedish non-Finnish colleague comes to you
and states that your regular expression
makes no sense: your regular expression matches
'Aland', 'Bland', 'Cland' (and 'Gland'), which can be improved
upon.

???- question "Why is the colleague non-Swedish non-Finnish?"

    Because he/she does not know that Sweden has an island called
    Öland and Finland has an island called Åland.

Read [the section 'Type of regular expressions'](#type-of-regular-expressions).

Search for all place names ending on `land` using `sed`.
To be precise, search for all matches that:

- (1) start with an uppercase character
- (2) have **one** or more lowercase characters:
  use a `+` in your regular expression
- (3) end on `land`.

???- question "Answer"

    ```bash
    cat macbeth.txt | sed --quiet --regexp-extended '/[A-Z][a-z]+land/p'
    ```

    This is equivalent to the syntax below.

    ```bash
    cat macbeth.txt | sed --quiet '/[A-Z][a-z][a-z]*land/p'
    ```

---

## Exercise 1.5: use `sed` to remove a line from standard input

Read [the 'Deleting' section](#deleting).

The Macbeth text contains a copyright notice at the start (and end) of it.

Find the line where the copyright notice at the start ends in any way:
it contains the text `START OF THE PROJECT GUTENBERG EBOOK`.

???- question "Answer"

    There are many ways.

    One way is to use a text editor that has line numbering.

    Another way is to use `cat` with the `--number` flag to let it add
    line numbers, then use `head` to only view
    the first 10, 20, 40, etc. lines:

    ```bash
    cat --number macbeth.txt  | head --lines 40
    ```

    Another way is to use `cat` with the `--number` flag to let it add
    line numbers, then use `grep` to find the location:

    ```bash
    cat --number macbeth.txt  | grep "START OF THE PROJECT GUTENBERG EBOOK"
    ```

You conclude that line 25 is the last line of the copyright notice,
as you've seen this text in your output:

<!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

```text
    25 *** START OF THE PROJECT GUTENBERG EBOOK THE COMPLETE WORKS OF WILLIAM SHAKESPEARE ***
```

    <!-- markdownlint-enable MD013 -->

Use `sed` to remove the lines in such a way that the first line will be
`THE TRAGEDY OF MACBETH`, use `head` to check.

???- question "Answer"

    Here is to remove the first lines:

    ```bash
    cat macbeth.txt | sed '1,26d'
    ```

    To check:

    ```bash
    cat macbeth.txt | sed '1,26d' | head 
    ```

We can now pipe text to `sed` to remove lines.

---

## Exercise 1.6: use `sed` to replace text from a file

Instead of piping text to `sed` to remove lines,
we now use `sed` directly on a file.

In the Macbeth text, there is a copyright notice at the bottom too,
starting with `START: FULL LICENSE`

Find out in which line the copyright notice starts in any way.

???- question "Answer"

    There are many ways.

    One way is to use a text editor that has line numbering.

    Another way is to use `cat` with the `--number` flag to let it add
    line numbers, then use `grep` to find the text we are looking for.

    ```bash
    cat --number macbeth.txt | grep "START: FULL LICENSE"
    ```

You conclude that line 4173 is the last line of the copyright notice,
as you've seen this text in your output:

```text
  4173 START: FULL LICENSE
```

To be able to delete a range, we need to find out how many lines the file has.

Find out how many lines the file has.

???- question "Answer"

    There are many ways.

    One way is to use a text editor that has line numbering.

    Another way is to use `cat` with the `--number` flag to let it add
    line numbers, then use `tail` to show the last lines:

    ```bash
    cat --number macbeth.txt | tail
    ```

    Another way is to let the word count tool `wc` print the number of lines:

    ```bash
    wc --lines macbeth.txt
    ```

You conclude that the file has 4495 lines.

Let `sed` remove the copyright at the end
(i.e. lines 4173 to and including line 4495).

???- question "Answer"

    ```bash
    sed '4173,4495d' macbeth.txt
    ```

Let `sed` remove the copyright at the **beginning and** end
(i.e. lines 1 to (and including) 26 and lines 4173 to (and including) 4495).
Check using `head` and `tail`.

???- question "Answer"

    To remove the lines at the start and end:

    ```bash
    sed '1,26d;4173,4495d' macbeth.txt
    ```

    To check:

    ```bash
    sed '1,26d;4173,4495d' macbeth.txt | head
    sed '1,26d;4173,4495d' macbeth.txt | tail
    ```

---

## Exercise 1.7: use `sed` to replace text in a file

Until now, we never have touched the original file.
Here we use `sed --in-place [commands] [filename]`
to directly work on the original file.

Using `sed` directly on the file `macbeth.txt`,
replace `Weird Sisters` by `witches`

???- question "Answer"

  ```bash
  sed --in-place 's/Weird Sisters/witches/g' macbeth.txt
  ```

Using `sed` directly on the file `macbeth.txt`,
replace 'lands' by `Sweden`.

???- question "Answer"

    These are all valid answers:

    ```bash
    sed --in-place 's/[A-Z][a-z][a-z]*land/Sweden/' macbeth.txt
    sed --in-place 's/[A-Z][a-z][a-z]*land/Sweden/g' macbeth.txt
    sed --in-place --regexp-extended 's/[A-Z][a-z]+land/Sweden/' macbeth.txt
    sed --in-place --regexp-extended 's/[A-Z][a-z]+land/Sweden/g' macbeth.txt
    ```

Using `sed` directly on the file `macbeth.txt`,
to remove the copyright.


???- question "Answer"

  ```bash
  sed --in-place '1,26d;4173,4495d' macbeth.txt
  ```

---

## (optional) Exercise 1.8: Do this exercise from a script

Do this exercise from a script.

???- question "Answer"

    This is simply putting the answers in one file:

    <!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/sessions/sed/macbeth.txt
    sed --in-place 's/Weird Sisters/witches/g' macbeth.txt
    sed --in-place 's/[A-Z][a-z][a-z]*land/Sweden/' macbeth.txt
    sed --in-place '1,26d;4173,4495d' macbeth.txt
    ```

    <!-- markdownlint-enable MD013 -->

    Optional is to add a shebang as the first line:

    ```bash
    #!/bin/bash
    ```

    Optional is to remove `macbeth.txt` if it already exists before
    downloading, as shown below. The `--force` makes sure that this
    commands 'works' even
    if the file is absent.

    ```bash
    rm --force macbeth.txt
    ```

    You can obtain this script by:

    <!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/lesson_plans/20251204/script_1.sh
    ```

    <!-- markdownlint-enable MD013 -->

---

## (optional) Exercise 1.9: Do this exercise from a smart script

Do this exercise from a script,
without hardcoding the lines

???- question "Answer"

    Here we extract the line numbers:

    <!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    #!/bin/bash
    rm -f macbeth.txt
    wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/sessions/sed/macbeth.txt
    sed --in-place 's/Weird Sisters/witches/g' macbeth.txt
    sed --in-place 's/[A-Z][a-z][a-z]*land/Sweden/' macbeth.txt

    end_of_first_copyright_line=$(cat --number macbeth.txt | grep "START OF THE PROJECT GUTENBERG EBOOK" | cut --field 1)
    begin_of_second_copyright_line=$(cat --number macbeth.txt | grep "START: FULL LICENSE" | cut --field 1)
    last_line=$(wc --lines macbeth.txt | cut --field 1 --delimiter " ")

    sed --in-place "1,${end_of_first_copyright_line}d;${begin_of_second_copyright_line},${last_line}d" macbeth.txt
    ```

    <!-- markdownlint-enable MD013 -->

    You can obtain this script by:

    <!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/lesson_plans/20251204/script_2.sh
    ```

    <!-- markdownlint-enable MD013 -->

---

## (optional) Exercise 2: using the `sed` manuals

In this exercise, we'll use the `sed` manuals:

Manual type            |Description
-----------------------|-----------------------------------
`man` page             |High-level usage
`info` page            |More detailed usage, easier to read
the online `sed` manual|Usage at all levels, easier to read

---

## Exercise 2.1: view the `sed` manual

View the `sed` manual.

??? tip "The command to view a manual"

    `man` is the command to view a manual

??? tip "Answer"

    In the terminal, type:

    ```bash
    sed grep
    ```

    Use the arrow keys to navigate and `q` to quit

According to this `sed` manual, **in a one-liner**, what is `sed`?

Tip: it is at the top.

??? tip "Answer"

    `sed` is a 'stream editor for filtering and transforming text'.

    It is in the fourth line:

    <!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

    ```console
    SED(1)                                User Commands                                SED(1)

    NAME
           sed - stream editor for filtering and transforming text
    ```

    <!-- markdownlint-enable MD013 -->

---

## (optional) Exercise 2.2: view the `sed` info page

View the `sed` info page.

??? tip "The command to view an info page"

    `info` is the command to view an info page.

??? tip "Answer"

    In the terminal, type:

    ```bash
    info grep
    ```

    Use the arrow keys to navigate and `q` to quit

In to `sed` info page, go to the introduction.
What is `sed` according to this info page?
What does that definition mean?

??? tip "Answer"

    At the info pages it states:

    ```text
    ‘sed’ is a stream editor.  A stream editor is used to perform basic text
    transformations on an input stream (a file or input from a pipeline).
    ```

    It means that you can let `sed` work on input from a stream of from
    a file.

---

## (optional) Exercise 2.3: view the online `sed` manual

According to the online `sed` manual at
[`https://www.gnu.org/software/sed/`](https://www.gnu.org/software/sed/),
what is `sed`? What does that definition mean?

??? tip "Answer"

    At [https://www.gnu.org/software/sed/](https://www.gnu.org/software/sed/)
    the first line reads:

    > `sed` is 'a non-interactive command-line text editor'

    It means that you can let `sed` work on your file (like you
    do with e.g. `nano`) without you opening the file.

---

!!! note "Summary"

    - `sed` can do what `grep` can do and more
    - `sed` is a 'stream editor' and also called
      'a non-interactive command-line text editor'
    - `sed` can use multiple combinations of input and output
    - `sed` can do multiple operations,
      such as filtering, substituting and deleting
    - `sed` can use two regular expression syntaxes
    - `sed` is not a programming language: use AWK instead
