---
tags:
  - session
  - introduction
  - intro
---

# Introduction

- [Welcome page and syllabus](https://uppmax.github.io/linux-command-line-201/)

  - Also link at the House symbol at the top of the page.

Most of the commands you learn in this course are agnostic and works on any Linux/Unix like system.

Most HPC centers has `bash` as default. There are several reasons, but one is that it is what is compatible with SLURM - the batch scheduler used at most centers in Sweden. `bash` is also good for scripting.

For many commands it does not matter which shell you are using, but there are several where it is relevant, particularly for scripting. We will therefore be using `bash` for this course.

## Important stuff

- We have a [page with important information](https://umeauniversity.sharepoint.com/:w:/s/HPC2N630/IQBunrsmVEdHQK83ZwRbe8pKAV8qX_yz6iBeJNIgjy607_U).
- [The Question and Answer page](https://umeauniversity.sharepoint.com/:w:/s/HPC2N630/IQDuz8YWkZKbQYbSMu4G4tieATvCSmWoqCO7M3l1-hoJbS4) for questions to the instructors during the course.

## Exercises

The exercises are mostly on the pages, but you need some files to work with for several of the exercises. These files are in the "exercises.tar.gz" tarball.

You get it with:

```bash
wget https://github.com/UPPMAX/linux-command-line-201/raw/refs/heads/main/exercises.tar.gz
```

Then you unpack it with:

```bash
tar -zxvf exercises.tar.gz
```

## Evaluation

- This course is running for the third time and we would very much like
  some input on how we did so we can develop and improve the course.
- Here is [the evaluation survey](https://forms.office.com/e/WqYafTj557)
