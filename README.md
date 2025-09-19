# dotfiles

I manage my dotfiles using [rcm](http://thoughtbot.github.io/rcm/).

```bash
git clone git@github.com:richardscollin/.dotfiles.git

# install dotfiles with rcm
sudo apt-get install rcm

# install just the rcrc config file
RCRC=$HOME/.dotfiles/rcrc rcup -v rcrc

# after rcrc config is installed,
# future rcm commands don't require the RCRC environment variable to be set

# check installation files for individual config before installing
lsrc -v vim

# install individual config
rcup -v vim

# check installation files for all configs before installing
lsrc -v

rcup -v
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

