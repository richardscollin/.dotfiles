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


### e vs. vi

On my local development machine, I've gotten into the habit of typing
`e` to editor my text files through the e-wrapper program. However I often
also edit files on other machines. I want the commands I type to
also work on other machines. e-wrapper also has the nice feature it will
convert the line number after a file `/path/to/file:25` into a way understood
by the editor: `vim /path/to/file +25`. It's convenient to copy and paste
output from logs directly with `e-wrapper`.

I can switch back to using the vi command with my own custom editors by making
use of Debian's update alternatives feature.

### Debian Update Alternatives

```bash
sudo update-alternatives --install /usr/bin/vi vi /home/collin/bin/nvim 100
```




## Misc

Want to do this later: <https://forums.lenovo.com/t5/Displays-Options-and-Accessories/External-Thinkpad-Keyboard-KU-1255-switch-Fn-Ctrl-on-non-thinkpad-PC/m-p/2192639?page=3#3954879>


Stow
====
```
./configure --prefix=/usr/local/stow/tmux-3.4
make
make install
cd /usr/local/stow
sudo stow tmux-3.4

# remove
sudo stow --delete tmux-3.4
```





