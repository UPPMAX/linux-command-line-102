# Intermediate Bash/Linux

<!-- markdownlint-disable MD013 --><!-- Badges cannot be split up over lines, hence will break 80 characters per line -->

[![Check links](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/check_links.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/check_links.yaml)
[![Check Markdown](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/check_markdown.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/check_markdown.yaml)
[![Check spelling](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/check_spelling.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/check_spelling.yaml)
[![Create site](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/create_website.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/linux-command-line-201/actions/workflows/create_website.yaml)
[![DOI](https://zenodo.org/badge/887694497.svg)](https://doi.org/10.5281/zenodo.15551066)

<!-- markdownlint-enable MD013 -->

```text
This repository is part of UPPMAX
until [some organisation] has its own GitHub account.
UPPMAX is chosen for practical reasons unrelated to its importance.
```

- [Go to the nicely rendered site of this course](https://uppmax.github.io/linux-command-line-201)

## Files used by continuous integration scripts

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

| Filename                                   | Description                                                                                                                                 |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| [`mlc_config.json`](mlc_config.json)         | Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally      |
| [.checkov.yaml](.checkov.yaml)             | Configuration of [checkov](https://www.checkov.io/), run [scripts/run_checkov.sh](scripts/run_checkov.sh)                                   |
| [.shellcheckrc](.shellcheckrc)             | Configuration of the Bash style checker, run [scripts/run_bash_check.sh](scripts/run_bash_check.sh)                                         |
| [`.spellcheck.yml`](.spellcheck.yml)         | Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do a spell check locally                                         |
| [`.wordlist.txt`](.wordlist.txt)             | Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do a spell check locally                                    |
| [`.markdownlint.jsonc`](.markdownlint.jsonc) | Configuration of the Markdown linter, use `markdownlint "**/*.md"` to do Markdown linting locally. The name of this file is a default name. |
| [`.markdownlintignore`](.markdownlintignore) | Files ignored by the Markdown linter, use `markdownlint "**/*.md"` to do Markdown linting locally. The name of this file is a default name. |

<!-- markdownlint-enable MD013 -->
