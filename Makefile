.PHONY: all

DOTFILES := $(HOME)/.dotfiles

TARGETS := \
	$(HOME)/.aliases \
	$(HOME)/.bashrc \
	$(HOME)/.config/fish/config.fish \
	$(HOME)/.config/ghostty \
	$(HOME)/.config/git \
	$(HOME)/.config/jj \
	$(HOME)/.config/nvim \
	$(HOME)/.config/tmux \
	$(HOME)/.env \
	$(HOME)/.env.personal \
	$(HOME)/.inputrc \
	$(HOME)/bin

all: $(TARGETS)

$(HOME)/.aliases:
	ln -s $(DOTFILES)/aliases $@

$(HOME)/.bashrc:
	ln -s $(DOTFILES)/bashrc $@

$(HOME)/.config/fish/config.fish:
	@mkdir -p $(HOME)/.config/fish
	ln -s $(DOTFILES)/config/fish/config.fish $@

$(HOME)/.config/git:
	ln -s $(DOTFILES)/config/git $@

$(HOME)/.config/ghostty:
	ln -s $(DOTFILES)/config/ghostty $@

$(HOME)/.config/jj:
	ln -s $(DOTFILES)/config/jj $@

$(HOME)/.config/nvim:
	ln -s $(DOTFILES)/config/nvim $@

$(HOME)/.config/tmux:
	ln -s $(DOTFILES)/config/tmux $@

$(HOME)/.env:
	ln -s $(DOTFILES)/env $@

$(HOME)/.env.personal:
	ln -s $(DOTFILES)/env.personal $@

$(HOME)/.inputrc:
	ln -s $(DOTFILES)/inputrc $@

$(HOME)/bin:
	ln -s $(DOTFILES)/bin $@
