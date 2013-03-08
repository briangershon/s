#!/bin/sh
# Author: Brian Gershon, 3/8/13
# 
# Do a smart VCS working directory 'status' depending on if you're in a git,
# 	mercurial or subversion repository.
# 

clear

if `git rev-parse 2> /dev/null`; then
	git status
	exit
fi

if `hg -q stat 2> /dev/null`; then
	hg status
	exit
fi

if `svn info 1> /dev/null 2> /dev/null`; then
	svn st
	exit
fi

echo "No git, hg or svn repository found here."