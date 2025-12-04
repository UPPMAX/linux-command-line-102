# Reflection 2025-06-03

- [Lesson plan](../../lesson_plans/20250603/README.md)
- [Evaluation](../../evaluations/20250602/README.md)
- [Reflection](../../reflections/20250603/README.md)

## First hour

The first hour went smoothly and followed the schedule
smoothly:

| Scheduled time | Actual time | Phase     |
| -------------- | ----------- | --------- |
| 9:00           | 9:00        | Prior     |
| 9:10           | 9:08 (-2)   | Present   |
| 9:15           | 9:11 (-4)   | Challenge |
| 9:50           | 9:50        | Feedback  |
| 10:00          | 10:00       | Done      |

- 65% of the time spent on exercises

I had 4 breakout rooms, with exactly 2 learners each.
3 out of 4 rooms were duos that were sharing
their screen and had fun discussions, with the
occasional question. 1 room has 1 learner that could not
actually work: she uses Dardel and Dardel does not have `nano` installed ...?
I recommended `emacs`, which she enjoyed much better than `vi`.

I will ask PDC to add `nano` on Dardel.

- [ ] Ask PDC to install `nano` on Dardel

I was unhappy with my Feedback yesterday,
so I did it differently: I went through
the answers of the questions. This felt way
better! Instead of going through all answers,
however, I got only to answer 4 of 9.
I did sidetrack by choice, yet, I feel that next time,
I should go through all the answers first, and only then ask
the harder questions.

- Grade: 8.0

## Second hour

Directly after the break, 6 out of 11
learners turned on their camera.
When the recording started, this turned into 1
learner that kept his camera on.

I made an activity diagram:

| Time  | Activity   |
| ----- | ---------- |
| 10:15 | Lecturing  |
| 10:32 | Exercise   |
| 10:36 | Lecture    |
| 10:47 | Exercise   |
| 10:50 | Lecture    |
| 10:57 | Code along |
| 11:00 | Break      |

- 16% of the time spent on exercises

### Shared document, of second hour

- Q: If the variables we create are not persistent,
  how do they work in the context of a script? Will they be persistent if we
  write the variable in the script? I guess so...
    - A [Richel]: you are right :-): the variables in a script exist as long
    as the script runs.
- Is a hard link the same as copying?

    - A [Richel]: No: it means that the same file is at two locations at the
    same time. For example, if you delete the file from any of the two
    locations, it will be gone at both locations.
    - A. [Birgitte] Yes, and same if you edit one of them,
    then the other is also edited

- Can you explain the concept of “standard error”? I am confused with the
  stats concept...

    - A [Richel]: any program can create different types of output.
    Regular output goes to `the standard output` (also called stdout).
    In a similar fashion, programs can write their error messages
    to a different `thing` (called a `stream`), called `standard error`
    or `stderr`. When this stream is displayed on screen, it sometimes is
    colored red, to indicate the text was sent to the standard error stream.
    Does that help? Yes thanks

- In uppmax we got a file with the error, to know if the script worked or not,
  do we have the same at dardel PDC, or we have to do the “search” of the
  stderr as you guys just taught us?

    - A [Richel]: as far as I know, this works exactly the same, where one
    uses `$?` To get the exit code of a previous command, e.g.

```bash
#!/bin/bash

./run_something.sh

if [[ $? -ne 0 ]]; then
  echo “ERROR happened!”
fi
```

      Does that help you? If not, or there is another problem,
      you can always contact me at `[Richel's work email address]` :-)

## Third hour

I made an activity diagram:

| Time  | Activity   |
| ----- | ---------- |
| 11:15 | Lecturing  |
| 11:57 | Evaluation |

- 0% of the time spent on exercises

I did the evaluation here.

### Shared document, of third hour

- Why would you use tar to archive your files when you can just compress them
  with gzip?

    - A [Richel]: both tools achieve similar results, so you can use either.
    It can be, however, that you want to uncompress a file on –for
    example- an old version of windows that does not support tar
    out-of-the-box. In that case, you may prefer to use gzip.

- Similar to (11): why do we first use tar and then compress rather than
  compress a directory directly? Tar makes it into one file?

    - A [Richel]: Yes, tar can compress multiple files into one.
    And you are right: it can also compress a folder with files.
    There is little difference: if you compress a folder (with files),
    then tar will re-create that folder (with files).
    Did that answer your question?

        - Sort of. I just was wondering what is the functional difference.
      The procedure is different (first tar to make several files into
      one `tarball`, then compress, second using zip directly just
      directly compresses all the files in the folder). Does it is mean
      that zip directly applies compression on every file individually
      and tar + gzip would apply compression on the tarball (so only 1
      file). Is there a performance difference there?
      [Answer is on next page :-) ]

            - A [Richel]: I don`t know the exact technical details here.
        Sure, I can google :-). Maybe creating a script and measuring
        directly is easier. I would bet on timings being identical.

                - I will look into it, maybe experiment a bit, thanks!

                    - A [Richel]: Fun!

- What is `nohup` doing along with `&`?

    - A [Richel]: `nohup` allows one to run something that continues after
    ending a terminal (`to hang up` was how terminals one day were ended).
    `&` allows one to run something in the background, which means a
    terminal can be used for running commands wile a process is running.
    Together, they allow for commands that run in the background while you
    remain logged in to the computer.

- Could you "overwrite” existing commands (e.g. `ls`) with an alias? If you
  prefer list format e.g. `ls -l`, might be nice to only have
  `alias ls=/usr/bin/ls -l`.
  Will the bash alias be prioritized over system's `ls`?

    - A [Richel]: yes. I just tried it and it works!

    ```bash
    alias ls="/usr/bin/ls -l"
    ```

## Course reflection

I think the course went well,
although I've not read the feedback of the learners yet.

Here are my current ideas:

- [x] Suggest to replace `awk` by `sed`:

    - B will have more time for the quality of life session
    - R thinks `sed` is a better follow-up after `grep`
    - R thinks `awk` is useless


- [The full course reflection](../202506_course/README.md)
