# dotfiles

My configuration files. I like to frequently change how I have these setup.

Previously, I was trying to move everything to make use of xdg-user dirs. Now I have given up on that goal and will just stick with the default location in most cases.

## Setup

```
git clone git@github.com:richardscollin/dotfiles.git ~/.config/dotfiles

# with rcm
sudo apt-get install rcm
RCRC=$HOME/.config/dotfiles/rcrc rcup -v
```

### Gnome Config Settings

- Disable Capslock

### Mac Keyboard

- install <https://github.com/free5lot/hid-apple-patched>

## Resources

- [rcm](http://thoughtbot.github.io/rcm/)
