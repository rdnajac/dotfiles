#!/bin/sh
set -eu

[ -x "$HOME/.local/bin/mise" ] && exit 0

installer=$(mktemp)
trap 'rm -f "$installer"' EXIT
curl -fsSL https://mise.run -o "$installer"
sh "$installer"
