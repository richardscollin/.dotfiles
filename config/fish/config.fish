if status is-interactive
    source ~/.aliases
    source ~/.env

    fish_add_path ~/bin
    fish_add_path ~/.local/bin

    motd
end
