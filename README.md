# dotfiles

I manage my dotfiles using `make`.

```bash
git clone git@github.com:richardscollin/.dotfiles.git

cd ~/.dotfiles

# check before installing
make -n

# install individual config
make ~/.config/nvim/init.lua

# install all configs
make
```

# Notes

I keep some notes here for my own quick reference.

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

