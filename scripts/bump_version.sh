#! /bin/sh -l
new_version=$(semver -c -i $1 $2)

echo "::set-output name=new_version::$new_version"