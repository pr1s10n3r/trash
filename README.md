# Trash CLI

_100% shell implementation._

Move your files to a trash directory instead of unlink them for more safety.  
Did you `rm -rf` an important directory? No worry! Just look for your files inside `$HOME/.trash`.

## How to use

Clone the `trash.sh` script file into a directory inside your `$PATH` and make it executable using `chmod`:

```shell
chmod +x /path/to/trash.sh
```

You can use it directly or create an alias for `rm` like this:

```shell
# File .bashrc/.zshrc/etc
alias rm="trash"
```

## Roadmap

- [ ] Add unique identifier to deleted files in order to allow duplicates inside the `$HOME/.trash` directory.
- [ ] Allow long option parameters.
- [ ] Add `--version` option.
