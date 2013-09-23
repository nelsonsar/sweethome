#!/bin/bash

DIR=$(git rev-parse --show-toplevel)
ctags-exuberant -R --exclude=".git" \
 -o "/home/nelson/tags.$(basename "$DIR")" \
 -h '.php' \
 --languages=-javascript,sql \
 --totals=yes \
 --tag-relative=yes \
 --PHP-kinds=+cfiv \
 --regex-PHP="/(abstract)?\s+class\s+([^ ]+)/\2/c/" \
 --regex-PHP="/(static|abstract|public |protected|private)\s+(final\s+)?function\s+(\&\s+)?([^ (]+)/\4/f/" \
 --regex-PHP="/interface\s+([^ ]+)/\1/i/" \
 --regex-PHP="/\$([a-zA-Z_][a-zA-Z0-9_]*)/\1/v/" \
 "$DIR"
