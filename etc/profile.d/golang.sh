# /etc/profile.d/golang.sh

GOPATH="$HOME/.local/go"
GOBIN="$GOPATH/bin"
GODOC="$GOPATH/doc"

export GOPATH GOBIN GODOC \
       PATH="$PATH:$GOBIN"
