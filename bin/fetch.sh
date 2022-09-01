#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "Illegal number of parameters"
	exit 1
fi

URLTEMPLATE=$1
PKGVERSION=$2
DIR=$3
NAME=$4

mkdir -p "$DIR/usr/bin"

URL=${URLTEMPLATE//VERSION/"$PKGVERSION"}

if [[ $URL =~ .*tar.gz ]]; then
	curl -Ls "$URL" | tar xzf - >"$DIR"/usr/bin/"$NAME"
else
	curl -Ls "$URL" | zcat >"$DIR"/usr/bin/"$NAME"
fi

chmod 755 "$DIR"/usr/bin/"$NAME"
