#! /usr/bin/env bash

USERNAME="PixelPulsea"
echo "Enter the name of the Github Repo:"
read NAME

git clone git@github.com:$USERNAME/$NAME.git
cd $NAME
direnv allow
