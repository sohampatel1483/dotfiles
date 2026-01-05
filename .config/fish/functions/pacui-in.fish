function pacui-in
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' --prompt="in> " | xargs -ro sudo pacman -S
end
