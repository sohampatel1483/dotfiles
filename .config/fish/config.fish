if status is-interactive
    # Commands to run in interactive sessions can go here
end



#starship init fish | source
set -g fish_greeting

alias ls='lsd'
zoxide init fish | source
