#!/usr/bin/env bash

echo $REPLY;
zellij action toggle-floating-panes
zellij action write-chars "$REPLY"
