<!-- markdownlint-disable MD013 --><!-- Let's break the 80 characters per line -->
<!-- markdownlint-disable MD009 --><!-- Let's stop checking for trailing spaces -->
# Linux tools - wc and cut

!!! note "Learning objectives"

    - learn about ``wc``
    - try some examples with ``wc``
    - learn about ``cut``
    - try some examples with ``cut``

## wc

The Linux ``wc`` command calculates a file's word, line, character, or byte count (returning the values in that order from left to right).

### Syntax

```bash
wc <options> file
```

!!! note "Some common options"

    - **-l**: list number of lines per file
    - **-m**: list number of characters per file
    - **-w**: list number of words per file

### Examples

To run the examples, go to the “exercises” -> “piping-wc-cut” directory where there are files that are suitable to run these examples on.

!!! hint

    Type along!

!!! note "wc on a file"

    ```bash
    $ wc FILE
    ```

    Output:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc myfile1.txt
     4 15 80 myfile1.txt
    ```

    ``wc`` counted the number of lines, words, and characters in the file "myfile1.txt". It says there are **4 lines**, **15 words**, and **80 characters**.

!!! note "wc on several files"

    Let us run ``wc`` on all files with suffix .txt

    ```bash
    $ wc *.txt
    ```

    Output:

    ```bash
      1   9  45 fil2.txt
      1   9  43 fil3.txt
      2  10  48 fil4.txt
      4  22 128 file.txt
      1   6  34 fil.txt
      0   0   0 myfile0.txt
      4  15  80 myfile1.txt
      2  10  48 myfile2.txt
      7  38 203 myfile3.txt
      0   0   0 myfiles.txt
      4  22 128 newfile.txt
     12  12  33 numbers.txt
      0   0   0 thisfile0.txt
      0   0   0 thisfile1.txt
      0   0   0 thisfile2.txt
      0   0   0 thisfile3.txt
      0   0   0 thisfile4.txt
      0   0   0 thisfile5.txt
      0   0   0 thisfile6.txt
      0   0   0 thisfile7.txt
      0   0   0 thisfile8.txt
      0   0   0 thisfile9.txt
      0   0   0 thisfile.txt
     38 153 790 total
    ```

    All lines, words, characters in the files with the extension .txt. Also sums up the total.

!!! note "wc -l to get only the number of lines in a file"

    ```bash
    $ wc -l FILE
    ```

    Output:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc -l myfile2.txt
    2 myfile2.txt
    ```

!!! note "wc combined with a pipe and sort to get the files with suffix .txt in a given order"

    ```bash
    $ wc *.txt | sort -n
    ```

    Output:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc *.txt | sort -n
      0   0   0 myfile0.txt
      0   0   0 myfiles.txt
      0   0   0 thisfile0.txt
      0   0   0 thisfile1.txt
      0   0   0 thisfile2.txt
      0   0   0 thisfile3.txt
      0   0   0 thisfile4.txt
      0   0   0 thisfile5.txt
      0   0   0 thisfile6.txt
      0   0   0 thisfile7.txt
      0   0   0 thisfile8.txt
      0   0   0 thisfile9.txt
      0   0   0 thisfile.txt
      1   6  34 fil.txt
      1   9  43 fil3.txt
      1   9  45 fil2.txt
      2  10  48 fil4.txt
      2  10  48 myfile2.txt
      4  15  80 myfile1.txt
      4  22 128 file.txt
      4  22 128 newfile.txt
      7  38 203 myfile3.txt
     12  12  33 numbers.txt
     38 153 790 total
    ```

!!! warning "wc with no input"

    If you just do ``wc`` without giving any files as input, it will assume it should wait for input. If you just want to escape this, you can do it with CTRL-C (Press the CTRL key and hold it down, then press the C key).

!!! note "wc - capturing output"

    Assume you have a large number of files that you want to run ``wc`` on. Then it will not work well to just get the output thrown to screen. It would be much better to get the output to a file, and you can do that this way:

    ```bash
    $ wc -l *.txt > filelength.txt
    ```

    This will take the number of lines for each file and put to the file "filelength.txt". You can then look inside that file:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc -l *.txt > filelength.txt
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cat filelength.txt
      1 fil2.txt
      1 fil3.txt
      2 fil4.txt
      4 file.txt
      1 fil.txt
      0 myfile0.txt
      4 myfile1.txt
      2 myfile2.txt
      7 myfile3.txt
      0 myfiles.txt
      4 newfile.txt
     12 numbers.txt
      0 thisfile0.txt
      0 thisfile1.txt
      0 thisfile2.txt
      0 thisfile3.txt
      0 thisfile4.txt
      0 thisfile5.txt
      0 thisfile6.txt
      0 thisfile7.txt
      0 thisfile8.txt
      0 thisfile9.txt
      0 thisfile.txt
     38 total
    ```

    If you have a lot if files, and so a lot of entries in the "filelength.txt", it might be better to use something like "less" to look in it so you can look through the file instead of getting it all output to screen.

### Exercise

!!! note "<img src="../../images/shell-logo_small.png"> Exercise"

    The “exercises” -> “piping-wc-cut” directory is where there are files that are suitable to run these examples on.

    1. Use the correct option to ``wc`` to count the number of words in "file.txt"
    2. Use the correct option to ``wc`` to count the number of characters in "numbers.txt"
    3. How many lines are there in total in all the files in the directory "piping-wc-cut"?

## cut

``cut`` is a command which is used to extract sections from each line of input.

### Syntax

```bash
cut [-b list] [-c list] [-f list] [-n] [-d delim] [-s] [file]
```

Extraction of line segments can typically be done by options/flags

- **bytes** (``-b``)
- **characters** (``-c``)
- **fields** (``-f``)

separated by a **delimiter** (``-d`` — the **tab character** by default).

A range must be provided in each case which consists of one of **N**, **N-M**, **N-** (N to the end of the line), or **-M** (beginning of the line to M), where N and M are counted from 1 (there is no zeroth value).

The options

- **-n** in combination with **-b** suppresses splits of multi-byte characters.
- **-s** bypasses lines which contain no field delimiters when **-f** is specified, unless otherwise indicated.

### Examples

We are again going to use the directory “exercises” -> “piping-wc-cut” as a source of files that are suitable to run these examples on.

!!! note "cut with the -b flag"

    The ``-b n`` option returns the first n bytes of a line.

    ```bash
    $ cut -b n FILE
    ```

    Output:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -b 1 newfile.txt
    T
    S
    S
    M
    ```

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -b 2 newfile.txt
    h
    o
    t
    u
    ```

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -b 2-5 newfile.txt
    his
    o ma
    trin
    uaha
    ```

    For reference, this is how the file looks:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cat newfile.txt
    This is a file with some strings. How many instances of string are there?
    So many times string!
    String string string!
    Muahahaha
    ```

!!! note "cut with the -c flag"

    A list following -c specifies a range of characters which will be returned

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -c 2-5 newfile.txt
    his
    o ma
    trin
    uaha
    ```

!!! warning "Note!"

    No difference between the **-b** and **-c** option right now.

    However, adding multibyte support is in progress and may enable a different behaviour of these two options in the future!

!!! note "cut with the -f and delimiter flags"

    ```bash
    $ cut -d "A-DELIMITER" -f FIELD-LIST
    ```

    ??? note "Click to see content of file thisfile8.txt"

        ```bash
        bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cat thisfile8.txt
        Hello:helloe:hello:hi there!
        What is this! Is this a list: yes, this, is, a, list
        Weird list? Normal list: 1, 2, 3, 4, 5, 6, 7, 8
        Why not? I need a tab
        I will write a longer sentence: there is a delimiter colon in this line
        One more line that has  a tab and one more  and another hahahaha
        ```

    Delimiter " " (space) and fields 2-4:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -f 2-4 -d " " thisfile8.txt
    there!
    is this! Is
    list? Normal list:
    not? I need a
    will write a
    more line that
    ```

    Delimiter ":" (colon) and fields 2-4:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -f 2-4 -d ":" thisfile8.txt
    helloe:hello:hi there!
     yes, this, is, a, list
     1, 2, 3, 4, 5, 6, 7, 8
    Why not? I need a tab
    there is a delimiter colon in this line
    One more line that has  a tab and one more  and another hahahaha
    ```

    Delimiter ":" (colon) and fields 3- (from 3 to the end):

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -f 3- -d ":" thisfile8.txt
    hello:hi there!


    Why not?    I need a tab

    One more line that has  a tab and one more  and another hahahaha
    ```

    Default delimiter (tab) and fields 3-4:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -f 3-4 thisfile8.txt
    Hello:helloe:hello:hi there!
    What is this! Is this a list: yes, this, is, a, list
    Weird list? Normal list: 1, 2, 3, 4, 5, 6, 7, 8

    I will write a longer sentence: there is a delimiter colon in this line
    and one more  and another
    ```

!!! hint "Info"

    - **-c** option is useful for fixed-length lines.
    - Most unix files doesn't have fixed-length lines. To extract the useful information you need to cut by fields rather than columns.
    - List of the fields number specified must be separated by comma. Ranges are not described with -f option.
    - cut uses tab as a default field delimiter but can also work with other delimiter by using -d option.

!!! note "Example: columns of data"

    Here we work with the file "data.dat" which is in the same directory as the other files.

    ??? note "Content of data.dat - click to reveal"

        ```bash
        bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cat data.dat
        123 456 5685 6969
        124 346 7322 5732
        321 124 1546 1632
        111 763 1242 1421
        ```

    Cutting column 2 and 3:

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cut -f 2,3 -d " " data.dat
    456 5685
    346 7322
    124 1546
    763 1242
    ```

### Exercises

!!! note "<img src="../../images/shell-logo_small.png"> Exercise"

    The “exercises” -> “piping-wc-cut” directory is where there are files that are suitable to run these examples on.

    1. Use ``cut`` and suitable option(s) to print column 1 and 4 of the file "data.dat"
    2. Create a file where you use ":" delimiters in. Use ``cut`` for different combination of fields and this delimiter
    3. See that you get the same output with options **-c** and **-b** for the files you try
    4. Output the first 4 characters of each line for a file you pick

## Summary

!!! note "Keypoints"

    - we have learned about ``wc``
        - and tried the options **-l** (lines), **-m** (characters), and **-w** (words)
    - we have learned about ``cut``
        - and tried the options for selecting with **bytes**, **characters**, **fields**, and used delimiters

