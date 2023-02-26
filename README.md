# Trash CLI

Move your files to a trash directory instead of unlink them for more safety.

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
