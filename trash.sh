#!/usr/bin/env bash

name=`basename "$0"`

print_error_help() {
  echo "$name: $1"
  echo "Try '$name --help' for more information."
  exit 1
}

move_trash_files() {
  for filepath in "$1"; do
    mv $1 $HOME/.trash
    if [ $verbose -eq 1 ]; then
      echo "removed '$filepath'"
    fi
  done
}

usage() {
  echo "Usage: $name [OPTION]... [FILE]..."
  echo 'Move FILE(s) to $HOME/.trash'
  echo
  echo '  -v, --verbose         explain what is being done'
  exit 0
}

## Main ##

# NOTE: In case any other script has used getopt
OPTIND=1

### Argument parsing
verbose=0

if [ "${#@}" -lt 1 ]
then
  print_error_help "missing operand"
fi

# NOTE: 'r' and 'f' are added but not required by `mv`
while getopts "h?vrf" opt; do
  case "$opt" in
    h) usage ;;
    v) verbose=1 ;;
  esac
done

shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift

### Magic starts here
if [ ! -d "$HOME/.trash" ]; then
  if [ $verbose -eq 1 ]; then
    echo "$name: '$HOME/.trash' directory not found. Creating"
  fi
  mkdir -p "$HOME/.trash"
fi

### Finally, move files to trash
move_trash_files $@
