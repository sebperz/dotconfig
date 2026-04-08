# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# export
export PATH
export EDITOR=hx


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"

# opencode
export PATH=/home/sebperz/.opencode/bin:$PATH
# go
export PATH=$PATH:/usr/local/go/bin
# gopls
export PATH="$PATH:$HOME/go/bin"

# alias
alias la="ls -al"
alias ll="ls -l"
alias e='hx "$(find | fzf --preview "cat {}")"'
