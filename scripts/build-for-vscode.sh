#!/bin/bash

# Exact string `vscode-webview-url`
# will be used by the VSCode extension to do a search and replace
npx parcel build assets/index.html --public-url "./vscode-webview-url"
