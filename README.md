# dotfiles

My configuration files managed with [rcm](http://thoughtbot.github.io/rcm/).

## Setup

```
git clone git@github.com:richardscollin/dotfiles.git ~/.dotfiles

# with rcm
sudo apt-get install rcm
RCRC=$HOME/.dotfiles/rcrc rcup -v

# without rcm
./scripts/install.sh
```

RCM assumes that the dotfiles will be installed at `~/.dotfiles`. Also it is managing it's own configuration which is used after installed at `~/.rcrc`. For this reason you must either set the config on first install or run the install command twice.

## Selectively install config
```
RCRC=$HOME/.dotfiles/rcrc rcup -t bash
```

## Re-export rcm script
```
rcup -v -g | sed "s|$HOME|\$HOME|g" > scripts/install.sh
# must use sed to replace username so exported script is portable
```
