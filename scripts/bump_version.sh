#! /bin/sh
new_version=(semver -c -i $2 $1)

echo "::set-output name=new_version::$new_version"