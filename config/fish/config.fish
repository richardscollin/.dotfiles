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

    if command -q rustup
        rustup completions fish | source
    end

    fish_add_path ~/bin
    fish_add_path ~/.local/bin

    # bind ctrl-z to fg to resume suspended jobs
    # https://github.com/fish-shell/fish-shell/issues/7152#issuecomment-663575001
    # https://stackoverflow.com/a/75950692
    bind \cz 'fg 2>/dev/null; commandline -f repaint'

    # ctrl-o to list
    bind \co __fish_list_current_token

    # ctrl-backspace to delete previous word
    bind \b backward-kill-word

    # export NVM_DIR="$HOME/.nvm"
    # source "$NVM_DIR/nvm.sh"

    fish_config prompt choose astronaut
end
