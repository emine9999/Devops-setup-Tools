#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew --version
brew install derailed/k9s/k9s

# Standard K9s Shortcuts
# Start K9s: k9s
# View resources: :pods, :svc, :deploy
# Search: /
# Logs: l
# Execute commands: s
# Describe resources: d
# Switch views: :ns, :pods
# Refresh: Ctrl-r
# Filter: :filter
# Help: ?
# Metrics: m
# Custom commands: :
# Exit: q