/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# tap
brew tap homebrew/cask-versions

brew install mas

brew cask install bettertouchtool keyboard-maestro dash alfred 
brew cask install karabiner-elements

brew cask install iterm2-beta
brew cask install qlstephen

brew tap d12frosted/emacs-plus
brew install emacs-plus\

brew install rg fd the_silver_searcher ack

brew cask install visual-studio-code visual-studio-code-insiders
brew install coreutils moreutils findutils gnu-sed wget curl grep openssh screen tmux
brew install pigz lynx pv tree 
brew install macvim
brew cask install macvim
brew install git neovim
# Node
brew install nodenv
nodenv install 12.16.2
nodenv global 12.16.2
nodenv rehash
nodenv init

brew cask install pdf-expert
nvim .zprofile
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
pyenv install 3.8.2
pyenv global 3.8.2

# Quick look plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package quicklookase qlvideo
xattr -d -r com.apple.quarantine ~/Library/QuickLook


# Zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"\

sudo chown -R bddev:staff /usr/local/share/zsh/site-functions\
sudo chown -R bddev:staff /usr/local/share/zsh\
sudo chmod -R 755 /usr/local/share/zsh/site-functions\
sudo chmod -R 755 /usr/local/share/zsh\
# cd   /usr/local/share/zsh/site-functions/
