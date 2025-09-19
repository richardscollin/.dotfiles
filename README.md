# dotfiles

I manage my dotfiles using [rcm](http://thoughtbot.github.io/rcm/).

```bash
git clone git@github.com:richardscollin/.dotfiles.git

# install dotfiles with rcm
sudo apt-get install rcm

RCRC=$HOME/.dotfiles/rcrc rcup -v

RCRC=$HOME/.dotfiles/rcrc rcup -v rcrc

# install individual config
rcup -v vim
```

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

<https://jeffkreeftmeijer.com/vim-16-color/>


