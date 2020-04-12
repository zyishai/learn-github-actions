#! /bin/sh -l

# fetch all tags
git fetch --depth=1 origin +refs/tags/*:refs/tags/*

# find the latest tag
t=$(git describe --tags `git rev-list --tags --max-count=1`)

if [ -z "$t" ]
then
    log=$(git log --pretty=oneline)
    t=0.0.0
else
    log=$(git log $t..HEAD --pretty=oneline)
fi

case "$log" in
    *#major* ) echo "::set-output name=release::major";;
    *#minor* ) echo "::set-output name=release::minor";;
    *#patch* ) echo "::set-output name=release::patch";;
    * ) echo "::set-output name=release::none";;
esac

echo "::set-output name=last_tag::$t"