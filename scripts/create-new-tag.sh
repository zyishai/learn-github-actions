#! /bin/sh -l

# $1 - GITHUB_OWNER
# $2 - GITHUB_TOKEN
# $3 - NEW_VERSION

# get current commit hash for tag
commit=$(git rev-parse HEAD)

# get repo name from git
remote=$(git config --get remote.origin.url)
repo=$(basename $remote .git)

# POST a new ref to repo via Github API
curl -s -X POST https://api.github.com/repos/$1/$repo/git/refs \
-H "Authorization: token $2" \
-d @- << EOF
{
  "ref": "refs/tags/v$3",
  "sha": "$commit"
}
EOF