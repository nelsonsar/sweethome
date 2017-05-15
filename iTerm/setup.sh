#!/bin/bash

# Download Material iTerm color schema
mkdir -p ~/iTerm && \
curl -Ss "https://cdn.rawgit.com/stoeffel/material-iterm/1.0.2/stable/material.itermcolors" -o "~/iTerm/material.itermcolors"

# Download Hack font
curl -Ss "https://github.com/chrissimpkins/Hack/releases/download/v2.020/Hack-v2_020-ttf.zip" -o "~/iTerm/hack_ttf.zip"
