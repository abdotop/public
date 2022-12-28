#!/usr/bin/env bash

# Unofficial Bash Strict Mode
set -euo pipefail
IFS='
'
script_dirS=$(cd -P "$(dirname "$BASH_SOURCE")" &>/dev/null && pwd)

FILENAME="../student/left.sh"
cd left

# True if FILE exists and is a regular file
if [ -f ${FILENAME} ]; then
    # FILE exists and it's not empty
    if [ -s ${FILENAME} ]; then
        if [[ $(cat $FILENAME | grep echo | wc -l) -ne 0 ]]; then
            echo "echo is not allowed in this exercise!"
            exit 1
            submitted=$(bash $FILENAME)
            expected=$(bash ../solutions/left.sh)
            diff <(echo "$submitted") <(echo "$expected")
        fi
    else
        echo "The file exist but is empty"
        exit 1
    fi
else
    echo "File does not exist"
    exit 1
fi
