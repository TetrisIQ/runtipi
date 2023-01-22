#!/usr/bin/env bash
echo '{ 
    "appsRepoUrl": "https://github.com/meienberger/runtipi-appstore.git/"
}' > state/settings.json
npm i -g pnpm
pnpm i
sudo apt-get update
sudo apt-get install jq fswatch -y
mkdir logs
mkdir data
sudo chown node logs
sudo chown node data 
# We need to change the owner of the files in the app-data folder
# if this failes we have to change the permission your self
fswatch --event=Created /workspaces/runtipi/app-data/ | \
   xargs -l1 sh -c 'echo "$1" && sudo chown node "$1" -R' -- &