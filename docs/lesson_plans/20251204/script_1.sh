#!/bin/bash
rm -f macbeth.txt
wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/sessions/sed/macbeth.txt
sed --in-place 's/Weird Sisters/witches/g' macbeth.txt
sed --in-place 's/[A-Z][a-z][a-z]*land/Sweden/' macbeth.txt
sed --in-place '1,26d;4173,4495d' macbeth.txt

