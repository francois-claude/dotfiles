#!/bin/sh

WS_NUM='1'
WS_NAME='Secondary'
WS_NAME_LOWER="_$(echo "$WS_NAME" | tr '[:upper:]' '[:lower:]')"

WS_DIR='/home/fclaude/.config/i3/workspaces'

cd "$WS_DIR"

## export tree
/usr/bin/i3-save-tree --workspace "$WS_NUM:$WS_NAME" > "ws_tmp.json" 

/bin/sleep 1

tail -n +2 "ws_tmp.json" | fgrep -v '// split' | sed 's|//||g' > "workspace_$WS_NUM$WS_NAME_LOWER.json" 

rm -f "ws_tmp.json"
