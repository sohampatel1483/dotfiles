function yayui-in
    yay -Slq | fzf --multi --preview 'yay -Si {1}' --prompt="yay-in> " | xargs -ro yay -S
end
