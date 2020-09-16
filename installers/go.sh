#!/usr/bin/env bash

if command -v go &> /dev/null
then
    echo "go already installed: $(go version)"
    exit 0
fi

VERSION='1.15'
echo "Downloading go v$VERSION"

sudo curl -Lso go$VERSION.linux-amd64.tar.gz https://golang.org/dl/go$VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
sudo rm go$VERSION.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

go get -u github.com/sourcegraph/go-langserver

exit 0
