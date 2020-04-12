#! /bin/sh -l

# fetch all tags
git fetch --depth=1 origin +refs/tags/*:refs/tags/*

# find the latest tag
t=$(git describe --tags `git rev-list --tags --max-count=1`)

if [ -z "$t" ]
then
    t=0.0.0
fi

echo "::set-output name=last_tag::$t"