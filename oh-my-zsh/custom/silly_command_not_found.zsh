#!/usr/bin/env bash

# so this will make your "Command not found" messages a little more fun
# bundler? I hardly know her!
# What is this gem you speak of?

# install by dumping somehwhere like ~/bin and then activate with adding 
# `source ~/bin/silly_command_not_found.sh` to either .bashrc or .zshrc

silly_not_found() {

    local cmd="$1"
    if [[ "$cmd" =~ .+er$ ]]
    then
        echo "$cmd? I hardly know her!"
    else
        echo "What is this $cmd you speak of?"
    fi
}

if [ -n "$BASH_VERSION" ]; then
    command_not_found_handle() {
        silly_not_found $*
        return $?
    }
elif [ -n "$ZSH_VERSION" ]; then
    command_not_found_handler() {
        silly_not_found $*
        return $?
    }
fi
