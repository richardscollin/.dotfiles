# dconf dump /org/gnome/terminal/legacy/keybindings/ > keys.dconf


# dconf reset -f /org/gnome/terminal/legacy/profiles:/
# dconf list /org/gnome/terminal/legacy/profiles:/

# make sure id matches one listed above
# dconf load /org/gnome/terminal/legacy/profiles:/:61832467-da7b-4a03-802f-a6311372a0e8/ < gnome-terminal.dconf
# dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < gnome-terminal.dconf


# alternatively for keybindings

# https://superuser.com/a/1538005
# Set gnome-terminal next, previous tab to ctrl-tab and ctrl-shift-tab
# gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
# gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
