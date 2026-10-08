#!/bin/sh
set -eu

line='[ -f ~/.profile ] && . ~/.profile'
grep -qxF "$line" ~/.bashrc 2>/dev/null || printf '\n%s\n' "$line" >> ~/.bashrc
