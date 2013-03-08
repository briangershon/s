#!/bin/sh
# Author: Brian Gershon, 3/8/13
# 
# Do a smart DVCS 'status' depending on if you're in a git or mercurial repository
# 

clear

if `git rev-parse 2> /dev/null`
then git status
fi

if `hg -q stat 2> /dev/null`
then hg status
fi
