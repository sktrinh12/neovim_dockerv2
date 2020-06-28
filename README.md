# NeovimDocker v2

Attempt to dockerize a neovim IDE with fzf/ripgrep, python autocomplete (deoplete), ipython capabilities (vim-slime) and other popular vim plugins. The container is portable and light-weight. Do away with the long process of setting up nvim for each computer. Use of Debian Buster.  

## Core code borrowed from:  

* <https://github.com/iimuz/dockerfile/blob/master/nvim-basic/Dockerfile>

## Run from console
1. First build the container. You may chose your own container name and tag.

```
	docker buid -t neovim-docker:latest .
```


2. Then run the container using:

```
	docker run \
        --rm -it \
        -v $(pwd):/workspace \
        neovim-docker:latest \ #name of the docker container
        "$@"
```

## Remarks

Must `cd` into the directory where the files you want to edit are located. Colorscheme is set to `gruvbox`. In order to send commands from the editor to the REPL usign `vim-slime`; simply open up a terminal buffer by typing, `:vsplit term://bash` then type `python` or `python3` and move to the terminal pane and type `echo b:terminal_job_id` and then move to the current buffer and enter the output into `:SlimeConfig`
