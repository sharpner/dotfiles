#settings
echo "Input hostname for this machine"
read hostname

if [ -z "$hostname" ] ; then
  echo "Hostname must be set."
  exit 1
fi

#get root access"
echo "We need root access to set the hostname"

#install configuration files
cp bash_profile ~/.bash_profile
#install ssh configuration for autocompletion
cp ssh_config ~/.ssh/config

#configure system
sudo scutil --set ComputerName $hostname
sudo scutil --set HostName $hostname
sudo scutil --set LocalHostName $hostname
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $hostname


defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


#create folder structure
mkdir -p ~/Development/Go
mkdir -p ~/.ssh/
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo
mkdir -p ~/bin
mkdir -p ~/.gnupg/

#install bin tools
cp goclone ~/bin

#tmux configuration
cp tmux.conf ~/.tmux.con
#install fonts
cp font/*.otf ~/Library/Fonts/
cp gpg-agent.conf ~/.gnupg/

#install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

#install brew dependencies
brew install socat
brew install tree
brew install gpg-agent
brew install wget
brew install weechat
brew install mc
brew install mongodb
brew install go --with-cc-all
brew install git
brew install vim --override-system-vi --with-python3
brew install npm
brew install mercurial
brew install bazaar
brew install ctags
brew install csfml
brew install graphviz
brew install docker-machine
brew install docker
brew install tree
brew install gpg
brew install pinentry-mac
brew install watch
brew install tmux
#installing screensaver

# for markdonw preview
npm -g install instant-markdown-d
# install diff so fancy
npm install -g diff-so-fancy

#utility for deploying ios test applications
npm install -g ios-deploy

#global git setup
git config --global user.name "n.wagensonner"
git config --global user.email "n.wagensonner@manyminds.de"
git config --global push.default simple
git config --global user.signingkey A28E65D8
git config --global commit.gpgsign true
git config --global gpg.program gpg2
git config --global core.excludesfile ~/.gitignore_global
ln -s `pwd`/gitignore_global ~/.gitignore_global

#install cask for brew
brew install caskroom/cask/brew-cask

#install closed source applications
brew cask install iterm2
brew cask install vlc
brew cask install virtualbox
brew cask install vagrant
brew cask install seil
brew cask install whatsapp
brew cask install telegram
brew cask install toggldesktop
brew cask install smoothmouse
source ~/.bash_profile

sudo gem install lunchy

#installing vim dependencies
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#import secret gpg keyds
gpg --allow-secret-key-import --import ~/Dropbox/Schlüssel/2016-06-04-github.asc


mkdir ~/.config/nvim/
ln -s `pwd`/nvimrc ~/.config/nvim/init.vim
ln -s `pwd`/vimrc ~/.vimrc

ln -s `pwd`/mongorc.js ~/.mongorc.js
#install all bundled vim plugins
vim +PluginInstall +qall

#go deps
go get -u -a golang.org/x/tools/cmd/cover
go get -u -a golang.org/x/tools/cmd/godoc
go get -u -a golang.org/x/tools/cmd/vet
go get -u -a github.com/tools/godep

#install configuration files
cp bash_profile ~/.bash_profile
#install ssh configuration for autocompletion
cp ssh_config ~/.ssh/config

#disable default save to cloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#disable app quarantine
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#faster responses on resume
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
chflags nohidden ~/Library
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

#safari settings

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#disable startup sound
sudo nvram SystemAudioVolume=%80

# autoconfigure seil
defaults write org.pqrs.Seil sysctl -dict enable_capslock 1 keycode_capslock 53
source ./keyboard-setup.sh

#if the hard disk gets very low, run the following command
#hash tmutil &> /dev/null && sudo tmutil disablelocal
echo "Now installing oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

git clone git@github.com:powerline/fonts.git ~/dotfiles/powerline-fonts/

#install powerline fonts
cd ~/dotfiles/powerline-fonts/ && ./install.sh && cd ~/dotfiles

rm ~/.zshrc && ln -s `pwd`/zshrc ~/.zshrc

echo "All done. "
echo "Install your private key file to ~/.ssh/id_rsa"
