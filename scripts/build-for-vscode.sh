#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR/"..  || exit 1

# If `node_modules`` doesn't exist run `npm ci`
# to install dependencies
if [ ! -d "node_modules" ]; then
  npm ci
fi

# Remove any old files
rm -rf dist

# Exact string `vscode-webview-url`
# will be used by the VSCode extension to do a search and replace
npx parcel build assets/index.html --out-dir ./dist  --public-url "./vscode-webview-url"
