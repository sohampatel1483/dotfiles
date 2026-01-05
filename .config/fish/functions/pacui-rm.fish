function pacui-rm
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' --prompt="rm> " | xargs -ro sudo pacman -Rns
end
