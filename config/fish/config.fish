if status is-interactive
    source ~/.env
    source ~/.env.personal
    source ~/.env.work

    source ~/.aliases

    zoxide init fish | source

    fish_add_path ~/bin
    fish_add_path ~/.local/bin

    motd
end
