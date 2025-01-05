if status is-interactive
    function source_file_if
        [ -r "$argv[1]" ] && source "$argv"
    end

    function source_cmd_if
        command -q "$argv[1]" && $argv | source
    end

    source_file_if ~/.env
    source_file_if ~/.env.personal
    source_file_if ~/.env.work

    source_file_if ~/.aliases
    source_file_if ~/.aliases.work

    source_cmd_if zoxide init fish
    source_cmd_if rustup completions fish
    source_cmd_if rg --generate=complete-fish

    fish_add_path ~/bin ~/.local/bin
    fish_add_path ~/.mozbuild/git-cinnabar
    fish_add_path /usr/local/go/bin

    # bind ctrl-z to fg to resume suspended jobs
    # https://github.com/fish-shell/fish-shell/issues/7152#issuecomment-663575001
    # https://stackoverflow.com/a/75950692
    bind \cz 'fg 2>/dev/null; commandline -f repaint'

    # ctrl-o to list
    bind \co __fish_list_current_token

    # ctrl-backspace to delete previous word
    bind \b backward-kill-bigword

    # make alt-p the same as ctrl-p
    bind -e \cp
    bind \ep up-or-search

    # make alt-n the same as ctrl-n
    bind \en down-or-search

    set -U fish_greeting
    fish_config prompt choose astronaut
end
