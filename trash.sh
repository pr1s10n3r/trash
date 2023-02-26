#!/usr/bin/env bash

name=`basename "$0"`

print_error_help() {
  echo "$name: $1"
  echo "Try '$name --help' for more information."
  exit 1
}

move_trash_files() {
  files=("$@")
  for filepath in "${files[@]}"; do
    if [ -f $filepath ]; then
      mv $filepath $HOME/.trash
      if [ $verbose -eq 1 ]; then
        echo "removed '$filepath'"
      fi
    elif [ ! $force -eq 1 ]; then
      echo "$name: cannot move '$filepath': No such file or directory"
    fi
  done
}

usage() {
  echo "Usage: $name [OPTION]... [FILE]..."
  echo 'Move FILE(s) to $HOME/.trash'
  echo
  echo '  -f, --force           ignore nonexistent files and arguments, never prompt'
  echo '  -v, --verbose         explain what is being done'
  echo '  -h, --help            display this help text and exit'
  echo '      --version         output version information and exit'
  exit 0
}

## Main ##

# NOTE: In case any other script has used getopt
OPTIND=1

### Argument parsing
force=0
verbose=0

if [ "${#@}" -lt 1 ]
then
  print_error_help "missing operand"
fi

# NOTE: 'r' is added but not required by `mv`
while getopts "h?vrf" opt; do
  case "$opt" in
    h) usage ;;
    f) force=1 ;;
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