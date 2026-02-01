# Environment variables

<a href="https://en.wikipedia.org/wiki/Environment_variable" target="_blank">Environment variables</a> store data that is used by the operating system and other programs.

Some are intrinsic to the operating system, some for a specific program/library/programming language, and some are created by the user.

The variables can both be used in scripts and on the command line. Usually you reference them by putting a special symbol in front of or around the variable name. By convention, environment variable names are in UPPER CASE.

**Examples**:

- **$HOME** Your home directory
- **$PWD** This variable points to your current directory
- **$LD_LIBRARY_PATH** a colon-separated list of directories that the dynamic linker should search for shared objects before searching in any other directories
- **$OMP_NUM_THREADS** Number of OpenMP threads
- **$PYTHONPATH** Path to the directory where your Python libraries and packages are installed

!!! note "To see the content of an environment variable named ENVIRONMENT-VARIABLE"

    ```bash
    echo $ENVIRONMENT-VARIABLE
    ```

!!! hint "Tip"

    You will get a long list of all environment variables currently set with the command:

    ```bash
    env
    ```

    You could also use

    ```bash
    printenv
    ```

    In their default state they work the same. The difference is twofold.

    1. You can use ``printenv`` to request the value of individual variables:
    ```bash
    $ printenv VARIABLE
    ```
    2. You can use ``env`` to modify the environment that programs run in by passing a set of variable definitions into a command like this:
    ```bash
    $ env VARIABLE="value" <command_to_run> <command_options>
    ```

!!! note "Some environment variables need to be exported in order to be used"

    This is how you set the environment variable VARIABLE to value:

    For the ``bash`` (and related) shells:

    ```bash
    export VARIABLE=value
    ```

    For ``csh`` and related shells:

    ```bash
    setenv VARIABLE value
    ```

You can create your own variables to use, for instance in **scripts**.

!!! note "Creating your own variable"

    I create a variable called MINE and set it to /usr/bin/gcc

    ```bash
    export MINE=/usr/bin/gcc
    ```

    Check it is set:

    ```bash
    echo $MINE
    ```

    You can now (until you start a new session) use $MINE instead of gcc:

    ```bash
    $ $MINE hello.c
    $ ls a.out
    a.out
    $ ./a.out
    Hello World!
    $
    ```

## Examples

!!! note "See the content of $PATH"

    ```bash
    $ echo $PATH
    ```

!!! note "Setting the number of OpenMP threads to 8 in bash"

    ```bash
    export OMP_NUM_THREADS=8
    ```

!!! note "More useful example of creating your own variable"

    Assume you have a script you run in a different directory than where you have the datafiles. You could then use an environment variable to give the path to the data directory instead of each time writing the full path:

    ```bash
    $ export DATAPATH=/home/bbrydsoe/project/dataset1/
    ```

    Then you can refer to that directory with $DATAPATH in your script.

!!! note "Adding a new path to $LD_LIBRARY_PATH"

    ```bash
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/your/custom/path/
    ```

!!! warning "Warning"

    The environment variable set this way only retains the value you have set for the duration of the *session*. When you open a new terminal window or login again, you need to set it *again*.

    To avoid that, add the environment variable to your .bashrc file, but only do so if it should truly be persistent across many sessions (like adding a new directory to search to ``LD_LIBRARY_PATH`` for instance).

!!! note "Quickly add a new directory to LD_LIBRARY_PATH in your .bashrc"

    ```bash
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/your/custom/path/" >> ~/.bashrc
    ```

    Change ``/your/custom/path/`` to the actual path to the directory for your library.

## Exercise

1. Run ``env`` to see the environment variables that are set at your computer
2. Use ``echo`` to see the content of ``$PWD`` - try change to another directory and run it again.
3. Create your own variable. Set it to something (export) and use ``echo`` to see that it has the right value.
4. Use ``printenv`` to tell you the value of an environment variable.

## Summary

!!! note "Keypoints"

    - environment variables are used to store data that is used by the operating system and other programs
    - Some common environment variables are:
        - **$HOME** Your home directory
        - **$PWD** This variable points to your current directory
        - **$LD_LIBRARY_PATH** a colon-separated list of directories that the dynamic linker should search for shared objects before searching in any other directories
        - **$OMP_NUM_THREADS** Number of OpenMP threads
        - **$PYTHONPATH** Path to the directory where your Python libraries and packages are installed
    - You can create own environment variables
    - ``env`` is useful
    - ``printenv`` is useful

