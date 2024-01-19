# dotfiles

I manage my dotfiles using [rcm](http://thoughtbot.github.io/rcm/).

```bash
git clone git@github.com:richardscollin/.dotfiles.git

# install dotfiles with rcm
sudo apt-get install rcm
RCRC=$HOME/.dotfiles/rcrc rcup -v

# install with exported script
./bin/install.sh

# install individual config
rcup -v vim

# dump the rcm init script to a self contained script
rcup -B 0 -g | sed "s|$HOME|\$HOME|g" > bin/install.sh
```

### Gnome Config Settings

```bash
# Swap capslock to ctrl
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
```

### Mac Keyboard

- install <https://github.com/free5lot/hid-apple-patched>
