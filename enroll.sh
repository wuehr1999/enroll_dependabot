#!/bin/bash

source repos.sh
repos=$REPOS

_reponame() {
  local base=$(basename $1)
  local reponame=${base%.*}
  echo $reponame
}

for r in $repos; do
  echo $r
  git clone $r
  name=$(echo $(_reponame $r))
  cd $name
  git checkout -b dependabot
  cp ../dependabot.yml .github/
  git add .
  git commit -m "enroll dependabot"
  git push -u origin dependabot
  gh pr create --title "Configure Dependabot to check for outdated actions used in workflows" --body "Dependabot will periodically check the versions of all actions used in the repository's workflows. If any are found to be outdated, it will submit a pull request to update them."
  cd ..
  sudo rm -r $name
done

