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

<https://github.com/NapoleonWils0n/cerberus/blob/master/ubuntu/wayland-xkb.org>

```bash
# capslock -> super (pressing capslock inputs super)
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:super']"

# use both super-j and super-k to switch between maximized and non-maximized window
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>k', '<Super>j']"
# I like being able to super-h and super-l to snap windows, but sometimes still like to be able to do super left/right
# may need to manually disable any existing keybindings that already use super-l and super-h
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>Right', '<Super>l']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>Left', '<Super>h']"

```

### Mac Keyboard

- install <https://github.com/free5lot/hid-apple-patched>
