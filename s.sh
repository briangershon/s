#!/bin/sh
# Author: Brian Gershon, 3/8/13
# 
# Do a smart VCS working directory 'status' depending on if you're in a git,
# 	mercurial or subversion repository.
# 

clear

if `git rev-parse 2> /dev/null`; then
	echo "---\nGit Repository Status\n---\n"
	git status
	exit
fi

if `hg -q stat 2> /dev/null`; then
	echo "---\nMercurial Repository Status\n("`hg id`")\n---\n"
	hg status
	exit
fi

if `svn info 1> /dev/null 2> /dev/null`; then
	echo "---\nSubversion Repository Status\n("`svn info | grep '^URL' | awk '{print $NF}'`")\n---\n"
	svn st
	exit
fi

echo "---\nA git, mercurial or subversion repository not found.\n---\n"