# Reflection

- Date: 2025-12-05
- Author: Richel
- Day: 2

I had a fun session with around 21 learners, with
around 11 in single-person and 5 in double-person
breakout rooms.

The session was about Bash. Because some already know Bash well,
I encouraged those to read the material about AWK. I did not spent
any time on the AWK course material, as it was dropped from the course
per this iteration. I've seen 3 learners try out this material, so
maybe I should update it. I encouraged the 3 learners to mention this
in the course evaluation.

In the breakout rooms, I had a good amount of questions,
around thirty in total,
ranging from spaces, curly braces, to AWK regular expressions.
I was happy to have this high amount of person-tailored interaction.

I have seen all learners either reach or finish the last exercise
of Bash (about for loops). 

In the end of my session, I did not summarize the content, as I felt
it was more useful to let the learners continue with whatever they
were working on.

## Shared document content

<!-- markdownlint-disable MD013 --><!-- Verbatim copy-paste that I will not split up, hence will break 80 characters per line -->

```text
- Is there a benefit to using find . -type f –name “*.txt” instead of ls *.txt for what we have looked at so far? 

    - [Richel] Not in this case. In other cases, the asterisk may be interpreted as something else, so sometimes people put quotes around it out of habit :-) 

- I was confused by the need of “numerical” sorting while we just looked at sorting based on columns..but may be I should know the how to already. 

    - [Richel] I think I understand: we pick a column to sort first by number, then we sort. If the text in the columns is ‘A’, ‘AB’ and ‘ABC’, these should be ordered like that. However, the text 100, 20 and 3 should not be sorted alphabetically: they need a numerical sort instead. I hope that that answers your question 😊 .  

- Yes, thanks.The sorting according to text or numerical will be done automatically by bash/linux comand? 

    - [Richel] `sort` assumes text and hence sorts alphabetically by default. Use `sort –numeric-sort` for numbers. There is even a ‘--month-sort' (for months) and ‘--human-numeric-sort' (for human notations such as 2k and 3M)! Find out by running ‘man sort’ :-) 

- What is the difference between cat and more?  

    - The command cat can do several things; output the content (without showing one screen-ful at a time), can also be used to concatenate files, and a number of other things. The command more will output one screenful at a time and let you look at that before using space to move to next. You can also search in the output  

- What is the difference between redirecting with > and piping with |? What would go wrong if I tried ls –l > head –5? 

    - [Richel] Piping does not (typically) create a file, where ‘>’ (typically) does. Your example ‘ls –l > head –5’ will create a file called ‘head’ and give an error that it does not know what to do with ‘-5’. Did that answer your question? 

        - Both > and | “redirect” the output of the previous command in a way. I guess what I was curious about whether one can force > to behave like |.  

- FYI there is an error in the answer to Exercise 9 loops in bash : missing dollar sign in echo "I found a file called {filename}!" 

    - [Richel] you are correct! It is fixed. Thanks! 

- What controls how much deflation would happen for a particular file? 

    - [Richel] Repetition in the file content: if your file only contains, e.g., ‘A’s, it will be compressed very well 😊 
```

<!-- markdownlint-enable MD013 -->

