if status is-interactive
    function sourceif
        [ -r "$argv[1]" ] && source "$argv"
    end

    sourceif ~/.env
    sourceif ~/.env.personal
    sourceif ~/.env.work

    sourceif ~/.aliases
    sourceif ~/.aliases.work

    zoxide init fish | source

    fish_add_path ~/bin
    fish_add_path ~/.local/bin
end
