#!/bin/bash
rm -f macbeth.txt
wget https://raw.githubusercontent.com/UPPMAX/linux-command-line-201/refs/heads/main/docs/sessions/sed/macbeth.txt
sed --in-place 's/Weird Sisters/witches/g' macbeth.txt
sed --in-place 's/[A-Z][a-z][a-z]*land/Sweden/' macbeth.txt

end_of_first_copyright_line=$(cat --number macbeth.txt | grep "START OF THE PROJECT GUTENBERG EBOOK" | cut --field 1)
begin_of_second_copyright_line=$(cat --number macbeth.txt | grep "START: FULL LICENSE" | cut --field 1)
last_line=$(wc --lines macbeth.txt | cut --field 1 --delimiter " ")

sed --in-place "1,${end_of_first_copyright_line}d;${begin_of_second_copyright_line},${last_line}d" macbeth.txt

