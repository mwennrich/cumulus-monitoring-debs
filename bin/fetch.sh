#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters"
fi

URL=$1
DIR=$2
NAME=$3

if [[ $URL  =~ .*tar.gz ]]; then
    curl -Ls "$URL" | tar xzf - > "$DIR"/usr/bin/"$NAME"
else
    curl -Ls "$URL" | zcat > "$DIR"/usr/bin/"$NAME"
fi

chmod 755 "$DIR"/usr/bin/"$NAME"
