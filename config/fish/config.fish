if status is-interactive
    function sourceif
        [ -r "$argv[1]" ] && source "$argv"
    end

    sourceif ~/.env
    sourceif ~/.env.personal
    sourceif ~/.env.work

    sourceif ~/.aliases
    sourceif ~/.aliases.work

    if command -q zoxide
        zoxide init fish | source
    end

    fish_add_path ~/bin
    fish_add_path ~/.local/bin

    fish_config prompt choose astronaut

    function fish_right_prompt -d "Write out the right prompt"
        date '+%r'
    end

end
