---
tags:
  - session
  - lesson
  - grep
  - regular expressions
  - gnu
---

# Searching using regular expressions and `grep`

???- note "Need a video?"

    - [Introduction](https://youtu.be/sh52duacLWY)
    - [Exercise 1](https://youtu.be/sh52duacLWY?t=155)
    - [Exercise 2](https://youtu.be/sh52duacLWY?t=349)
    - [Exercise 3](https://youtu.be/sh52duacLWY?t=455)
    - [Exercise 4](https://youtu.be/sh52duacLWY?t=875)
    - [Feedback](https://youtu.be/sh52duacLWY?t=1279)
    - [Conclusion](https://youtu.be/sh52duacLWY?t=1486)

!!! info "Learning outcomes"

    - Learners know there are multiple flavours of regular expressions
    - Learners can use `.`, `*`, `+`, `?`, `[]`, `[^]`, `{}`, `()` in regular expressions
    - Learners can use `grep`
    - Learners have practiced using the `grep` manual
    - Learners can use `grep` to search for a regular expression
    - Learners can send text to `grep` using a pipe
    - (optional) Learners have seen the flexibility of `grep`

???- note "For teachers"

    Lesson plan:

    Time         |Minutes|Duration|Description
    -------------|-------|--------|---------
    10:20-10:30  |0-10   |10      |Prior
    10:30-10:35  |10-15  |5       |Present
    10:35-10:55  |15-35  |20      |Challenge
    10:55-11:05  |35-45  |10      |Feedback and conclusion

    Prior:

    - How would tell an alien how a human name is made up
      out of English characters?
    - And a human phone number?
    - Are there more things that have certain features like that?
    - What is a regular expression?
    - What is `grep`?
    - What is GNU?
    - In the context of software, what is a parser?
    - In the context of command-line tools, what is a filter?

## Why use regular expressions?

Regular expressions are used to filter for text that contains a pattern,
such as a first name, a last name, a phone number, etc.

![What regular expressions are used for](why_regular_expressions.png)

## Why use `grep`?

`grep` finds text that matches a regular expression:

```text
$ cat macbeth.txt | grep "[A-Z][a-z]*land"
Scene III. England. Before the King's Palace.
DUNCAN, King of Scotland.
MACDUFF, Nobleman of Scotland.
LENNOX, Nobleman of Scotland.
ROSS, Nobleman of Scotland.
MENTEITH, Nobleman of Scotland.
ANGUS, Nobleman of Scotland.
CAITHNESS, Nobleman of Scotland.
SIWARD, Earl of Northumberland, General of the English Forces.
```

`grep` is among
[the list of 'Portable Operating System Interface' (POSIX) commands](https://en.wikipedia.org/wiki/List_of_POSIX_commands),
which means it is considered a fundamental tool
and is likely to be available on your operating system.

## Exercises

## Exercise 1: use the `grep` manual

In this exercise, we'll use the `grep` manual.

---

### Exercise 1.1: view the `grep` manual

View the `grep` manual.

Tip: `man` is the command to view a manual.

??? tip "Answer"

    In the terminal, type:

    ```bash
    man grep
    ```

    Use the arrow keys to navigate and `q` to quit

---

### Exercise 1.2: what does `grep` do?

According to the `grep` manual, **in a one-liner**, what does `grep` do?

Tip: it is at the top.

??? tip "Answer"

    `grep` is a tool to 'print lines that match patterns'
    It is in the fourth line:

    ```console
    NAME
           grep, egrep, fgrep, rgrep - print lines that match patterns
    ```

---

### Exercise 1.3: what are the other `grep`s?

In the fourth line of the `grep` manual, other
`grep`-like tools `egrep`, `fgrep` and `rgrep`
(which tools exactly may differ)
are mentioned. What are these?

Tips:

- it is in the first two screens.
- The first part of the answer can be found
  in the `DESCRIPTION` section,
- The second part of the answer can be found
  in the `OPTIONS | Pattern syntax` section

??? tip "Answer"

    Again, you may have an other list of `grep`-like tools.
    Here the manual of `grep` on Ubuntu (a Linux distribution)
    is used as an example. Even though your `grep` manual may differ,
    the procedure is the same.

    The first part of the answer is in the description:

    <!-- markdownlint-disable MD013 --><!-- Answer will be shown as-is, hence will break 80 characters per line -->

    ```console
    DESCRIPTION
           grep  searches  for  PATTERNS  in  each  FILE. [...]

           [...]

           Debian also includes the variant programs egrep, fgrep and rgrep.  These programs
           are the same as grep -E, grep -F, and grep -r, respectively.
          [...]
    ```

    <!-- markdownlint-enable MD013 -->

    Searching for `-E`, `-F` and `-r` takes us to the
    'OPTIONS | Pattern Syntax' subsection:

    ```console
    Pattern Syntax
       -E, --extended-regexp
              Interpret PATTERNS as extended regular expressions [...].

       [...]

       -G, --basic-regexp
              Interpret  PATTERNS  as basic regular expressions [...].

       -P, --perl-regexp
              Interpret PATTERNS as Perl-compatible regular expressions [...].
    ```

    We can conclude from this that the different `grep`s have different types
    of regular expressions, such as a regular, extended and Perl-compatible
    regular expressions.

---

## Exercise 2: use `grep` with a pipe

In this exercise, we use `grep` with a pipe.

### Exercise 2.1: read a command that has a `grep` with a pipe

How would you explain the command below in English?
Use 'some regular expression' if you see a regular expression.

```bash
man grep | grep "^[A-Z]"
```

??? tip "Answer"

    The manual of `grep`, send it to `grep` and let it filter for
    some regular expression.

---

### Exercise 2.2: run a command that has a `grep` with a pipe

Run the command above. What does it show on screen?
What did that regular expression do?

??? tip "Answer"

    Your output will be similar to this:

    <!-- markdownlint-disable MD013 --><!-- Answer will be shown as-is, hence will break 80 characters per line -->

    ```bash
    $ man grep | grep "^[A-Z]"
    GREP(1)                               User Commands                              GREP(1)
    NAME
    SYNOPSIS
    DESCRIPTION
    OPTIONS
    REGULAR EXPRESSIONS
    EXIT STATUS
    ENVIRONMENT
    NOTES
    COPYRIGHT
    BUGS
    EXAMPLE
    SEE ALSO
    GNU grep 3.11                          2019-12-29                                GREP(1)
    ```

    It shows all lines that start with an uppercase character.

    <!-- markdownlint-enable MD013 -->

---

## Exercise 3: practice regular expressions

Go to [https://www.regexone.com/](https://www.regexone.com/)
and do lessons 1 to (and including) 11.

???- info "Overview of these lessons"

    Here is an overview of the regular expression patterns in each lesson:

    Lesson|Pattern
    ------|-------
    1     |None
    1.5   |`\d`
    2     |`.`
    3     |`[]`
    4     |`[^]`
    5     |`[A-Z]`
    6     |`{}`
    7     |`*` (Kleene star) and `+` (Kleene plus)
    8     |`?`
    9     |`\s`
    10    |`^`
    11    |`()`

---

## Exercise 4

!!! info "Macbeth"

    ![Macbeth](macbeth_smaller.jpg)

    > [source](https://pixabay.com/illustrations/william-shakespeare-macbeth-poster-67764/)

In this exercise, we will work Macbeth, a tale written by William Shakespeare.

---

## Exercise 4.1: download Macbeth

Download the file from a terminal as such:

<!-- markdownlint-disable MD013 --><!-- Verbatim code cannot be split up over lines, hence will break 80 characters per line -->

```bash
wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/sessions/sed/macbeth.txt
```

<!-- markdownlint-enable MD013 -->

If that does not work, go to [the URL](https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/sessions/sed/macbeth.txt)
and download it manually and put it in your favorite folder.

---

## Exercise 4.2: find how often witches are mentioned

In Macbeth, there are some mentions of witches.
The word 'witches' is still being used.
The term 'weird sisters', however, is a less-known synonymn for witches.
As Macbeth uses this term, it can confuse the modern day reader.

- In Macbeth, how often is the term 'weird sisters' being used?
  It is used!

???- question "Answer"

    There are many patterns that will work:

    <!-- markdownlint-disable MD056 --><!-- Pipes confuse markdownlint -->

    Pattern             |Example full solution
    --------------------|---------------------------------------------
    `[Ww]eird [Ss]ister`|`cat macbeth.txt | grep "[Ww]eird [Ss]ister"`
    `[wW]eird [sS]ister`|`cat macbeth.txt | grep "[wW]eird [sS]ister"`
    `eird .ister`       |`cat macbeth.txt | grep "eird .ister"`

    <!-- markdownlint-enable MD056 -->

    Alternatively, one can use the `--ignore-case` (or `-i`)
    flag and use the pattern `weird sister`:

    <!-- markdownlint-disable MD056 --><!-- Pipes confuse markdownlint -->

    Pattern             |Example full solution
    --------------------|---------------------------------------------
    `weird sister`      |`cat macbeth.txt | grep --ignore-case "weird sister"`
    `weird sister`      |`cat macbeth.txt | grep -i "weird sister"`

    <!-- markdownlint-enable MD056 -->

    Alternatively, one can `grep` directly on the file:

    ```bash
    grep --ignore-case "weird sister" macbeth.txt
    ```

    In all cases, the output is:

    ```text
    The Weird Sisters, hand in hand,
    title, before, these Weird Sisters saluted me, and referred me to the
    I dreamt last night of the three Weird Sisters:
    (And betimes I will) to the Weird Sisters:
    Saw you the Weird Sisters?
    ```

    We can count that there are **five** mentions of the 'weird sisters'.

    You can go one step further and use `wc` for a direct answer:

    ```bash
    grep --ignore-case "weird sister" macbeth.txt | wc --lines
    ```

    This prints the number 5 on screen.

## Exercise 4.3: find how often countries are mentioned

In Macbeth, there are many place names ending on `land`.

Search for all place names ending on `land` using `grep`.
To be precise, search for all matches that:

- (1) start with an uppercase character
- (2) have zero or more lowercase characters
- (3) end on `land`

???- question "Answer"

    Here, the pattern is `[A-Z][a-z]*land"`.

    You can use this pattern in multiple ways:

    <!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->
    <!-- markdownlint-disable MD056 --><!-- Pipes confuse markdownlint -->

    Example solution                          |Description
    ------------------------------------------|--------------------------------------
    `grep "[A-Z][a-z]*land" macbeth.txt`      |Work directly on the file
    `cat macbeth.txt | grep "[A-Z][a-z]*land"`|Work on the output of `cat` via a pipe

    <!-- markdownlint-enable MD013 -->
    <!-- markdownlint-enable MD056 -->

    In either case, the (shortened) output will look like this:
    
    ```text
    Scene III. England. Before the King's Palace.
    DUNCAN, King of Scotland.
    MACDUFF, Nobleman of Scotland.
    ...
    Hail, King of Scotland!
    Hail, King of Scotland!
    Henceforth be earls, the first that ever Scotland
    ```

---

## (optional) Exercise 5: can `grep` do ...?

Here we'll experience the flexibility of `grep`.
Pick those topics you are interested in.

??? seealso "(optional) Exercise 5.1: Can `grep` do a case-insensitive match?"

    Can `grep` do a case-insensitive match?

    The answer is: yes!

    Use the `grep` manual to answer this question.

    ??? tip "Answer"

        Yes.

        The `--ignore-case` allows you
        to let `grep` do a case-insensitive search.

        For example, in the command below,
        the word 'options' is searched in the manual
        in a case-insensitive manner.

        <!-- markdownlint-disable MD013 --><!-- Verbatim text will be shown as-is, hence will break 80 characters per line -->

        ```bash
        $ man grep | grep --ignore-case "options"
        OPTIONS
                      use -i, to cancel its effects because the two options override each other.
                      options that prefix their output to the actual content: -H,-n, and -b.  In
                      options are given, the  last  matching  one  wins.   If  no  --include  or
                      --exclude  options  match, a file is included unless the first such option
           Other Options
                      other GNU programs.  POSIX requires that options that  follow  file  names
                      must  be  treated  as file names; by default, such options are permuted to
                      the front of the operand list and are treated  as  options.   Also,  POSIX
                      requires  that  unrecognized  options be diagnosed as “illegal”, but since
               treats expansions of “*g*.h” starting with “-” as file names not options, and the
        ```

        <!-- markdownlint-enable MD013 -->

??? seealso "(optional) Exercise 5.2: Can `grep` show the lines that do not match?"

    Can `grep` show the lines that **do not** match?

    The answer is: yes!

    Use the `grep` manual to answer this question.

    ??? tip "Answer"

        Yes.

        The `--invert-match` allows you
        to let `grep` show lines that do not match.

        For example, in the command below,
        the `grep` manual is search for lines that *do not* have a space.

        ```bash
        man grep | grep --invert-match " "
        ```

??? seealso "(optional) Exercise 5.3: Can `grep` detect lines in multiple files?"

    Can `grep` detect lines in multiple files?

    The answer is: yes!

    Use the `grep` manual to answer this question.

    ??? tip "Answer"

        Yes.

        The `--recursive` allows you to let `grep`
        search in multiple files.

        For example, in the commands below,
        the folder `/etc` is searched for files that contain the text 'ubuntu':

        ```bash
        cd /etc
        grep --recursive "ubuntu"
        ```

??? seealso "(optional) Exercise 5.4: Can `grep` detect which files contain a match?"

    Can `grep` detect which files contain a match?

    The answer is: yes!

    Use the `grep` manual to answer this question.

    ??? tip "Answer"

        Yes.

        The `--files-with-matches` allows you to let `grep`
        output which files contained a match.

        For example, in the commands below,
        the folder `/etc` is searched for files that contain the text 'ubuntu',
        showing the files in which a match is found:

        ```bash
        cd /etc
        grep --recursive --files-with-matches "ubuntu"
        ```

<!-- markdownlint-disable MD013 --><!-- Indeed a long title, hence will break 80 characters per line -->

??? seealso "(optional) Exercise 5.5: Can `grep` detect which files-with-a-certain-extension contain a match?"

    <!-- markdownlint-enable MD013 -->

    Can `grep` detect which files-with-a-certain-extension contain a match?

    The answer is: yes!

    Use the `grep` manual to answer this question.

    ??? tip "Answer"

        Yes.

        The `--include` allows you to let `grep`
        only include files in its

        For example, in the commands below,
        the folder `/etc` is searched in configuration (`.conf`)
        files that contain the text 'ubuntu'.

        ```bash
        cd /etc
        grep --recursive "ubuntu" --include "*.conf"
        ```

??? note "For teachers"

    How many regular expression dialects exist?

    ??? tip "Answer"

        At least 3:

        - `grep` (basic)
        - `egrep` (extended)
        - `pgrep` (Perl-like)


    ---

    We have sent the `grep` manual to `grep` using a pipe.
    Can we use any text?

    ??? tip "Answer"

        Yes: the `grep` manual is just text like any other.

    ---

    Can we send the output of `grep` to `grep`?

    ??? tip "Answer"

        Yes: the `grep` output is just text like any other.

    ---

    What is a Kleene star and what does it do?

    ??? tip "Answer"

        The Kleene star is the regular expression pattern `*`.
        In English it would be read as: 'the thing before it
        repeated at least zero times'.


    ---

    What is the difference between `[^A-Z]` and `^[A-Z]`?

    ??? tip "Answer"

        The first regular expression means: 'All characters, except all uppercase
        letters'.

        The second regular expression means: 'At the start of a line, any uppercase
        letter'.

    ---

    What is regular expression for 'any line of text' (including empty ones)?

    ??? tip "Answer"

        The regular expression for 'any line of text' is `.*`,
        as `.` means 'Any character' and `*` means 'repeated at least zero times'.

    ---

    Why does `man grep | grep .*` not work, where `man grep | grep ".*"` does?

    ??? tip "Answer"

        The double-quotes assure that the regular expression patter `.*` is
        read as such.

        The 'naked' `.*` is a `bash` expression of 'all hidden files',
        as hidden files start with a `.` (e.g. `ls .*`).
        This meaning can change depending on context (e.g. `cat .*`).

    ---

    Knowing that `grep --ignore-case` ignores case, and `grep --invert-match`
    inverts the match (i.e. showing non-matching lines), how to combine these
    in the same command?

    ??? tip "Answer"

        Write these one after the other:

        ```bash
        grep --ignore-case --invert-match
        ```

        For example, the command below shows all lines in the `grep` manual
        that do not have the lower-case, nor upper-case letters 'a' to
        (and including) 'f'.

        ```bash
        man grep | grep --ignore-case --invert-match "[a-f]"
        ```

---

## Conclusions

!!! info "Conclusions"

    - `grep` is used for pattern matching
    - `grep` has a useful manual
    - `grep` is a filter
    - `grep` works well with pipes
    - There are multiple regular expression dialects
    - The pattern `.`, `[]` and `[^]` are used
      to (not) match a (set of) characters
    - The pattern `*`, `+`, `?` and `{}` are used to indicate an amount
    - The pattern `()` is used to capture a set of a match
    - (optional) `grep` can do a lot of different things

---

## Next session

!!! info "Next session"

    `grep` cannot replace: use `sed` to do replacement using regular
    expressions
