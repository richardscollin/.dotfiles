if status is-interactive
    source ~/.aliases

    source ~/.env
    source ~/.env.personal
    source ~/.env.work

    fish_add_path ~/bin
    fish_add_path ~/.local/bin

    motd
end
