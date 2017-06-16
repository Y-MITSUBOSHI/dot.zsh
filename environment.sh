# ------------------------------
# Environment variable configuration
# ------------------------------
# LANG
export LANG=ja_JP.UTF-8

# OSX tarF
export COPYFILE_DISABLE=1

# Limit
limit coredumpsize 0

#golang
export GOROOT=$HOME/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin
