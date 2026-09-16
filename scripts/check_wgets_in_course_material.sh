#!/bin/bash
#
# Check that all wget commands in the course material actually download a file
#
# Usage:
#
#   ./scripts/check_wgets_in_course_material.sh

if [[ "$PWD" =~ scripts$ ]]; then
	echo "FATAL ERROR."
	echo "Please run the script from the project root. "
	echo "Present working director: $PWD"
	echo " "
	echo "Tip: like this"
	echo " "
	echo "  ./scripts/check_wgets_in_course_material.sh"
	echo " "
	exit 42
fi



urls=$(egrep -oR "wget.*" --include=*.md | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' | cut -d " " -f 2) 

for url in ${urls}
do
  echo "URL: ${url}"
  output_filename=$(mktemp)
  if [ -f ${output_filename} ]; then
    # echo "Deleting output file"
    rm ${output_filename}
  fi
  if [ -f ${output_filename} ]; then
    echo "ERROR: output file could not be deleted"
    exit 42
  fi

  wget ${url} --quiet -O ${output_filename}
  if [ -f ${output_filename} ]; then
    echo "OK: output file created for valid URL ${url}"
  else
    echo "ERROR: no output file created, invalid URL ${url}"
    exit 1
  fi
done


