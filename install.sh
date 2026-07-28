#!/bin/sh
set -eu

BIN_DIR="${HOME}/.local/bin"
CHEZMOI="${BIN_DIR}/chezmoi"

# install chezmoi if missing
if [ ! -x "$CHEZMOI" ] && ! CHEZMOI="$(command -v chezmoi)"; then
	echo "Installing chezmoi to '${BIN_DIR}/chezmoi'" >&2
	if command -v curl > /dev/null; then
		chezmoi_install_script="$(curl -fsSL https://chezmoi.io/get)"
	elif command -v wget > /dev/null; then
		chezmoi_install_script="$(wget -qO- https://chezmoi.io/get)"
	else
		echo "To install chezmoi, you must have curl or wget installed." >&2
		exit 1
	fi
	sh -c "$chezmoi_install_script" -- -b "$BIN_DIR"
	CHEZMOI="${BIN_DIR}/chezmoi"
	unset chezmoi_install_script
fi
unset BIN_DIR

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

set -- init --apply --debug --verbose --no-tty --source="$script_dir"

echo "Running 'chezmoi $*'" >&2
# replace current process with chezmoi
exec "$CHEZMOI" "$@"
