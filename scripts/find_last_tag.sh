#! /bin/sh -l

t=$(git describe --tags `git rev-list --tags --max-count=1`)

if [ -z "$t" ]
then
    t=0.0.0
fi

echo "::set-output name=last_tag::$t"