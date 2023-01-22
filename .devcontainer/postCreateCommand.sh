#!/usr/bin/env bash
./.devcontainer/createStateSettings.sh > state/settings.json
npm i -g pnpm
pnpm i
sudo apt-get update
sudo apt-get install jq fswatch
sudo chown node logs
sudo chown node data