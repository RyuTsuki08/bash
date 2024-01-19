#!/bin/bash

sudo apt install jq

user=$1


if [[ $user == 'RyuTsuki08' ]]
then
    gh repo list $user --json name > repos.json 
    repos=`jq '.[].name' repos.json`
    for repo in $repos
    do
        echo "You are $user"
        echo "Cloning repo $repo...."
        gh repo clone $user/${repo//\"} 
        sudo mv ${repo//\"} $PROJECT_DIR
    done
else
   echo '''
        Please, insert a username or verify your github-cli
        ''' 
fi
