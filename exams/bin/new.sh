#!/bin/bash

if [ "$1" = "" ]; then
  echo -e "Please specify a problem set name.\n\nUsage: $0 ps[n]\nExample: $0 ps3"
  exit
fi

mkdir "$1"
cp template/psXs.tex "$1/$1s.tex"
ln -s template/Makefile "$1/Makefile"

