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

#create folder structure
mkdir -p ~/Development/Go
mkdir -p ~/.ssh/
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo
mkdir -p ~/bin

#install bin tools
cp goclone ~/bin

#install fonts
cp font/*.otf ~/Library/Fonts/

#install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

#install brew dependencies
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

#installing screensaver
./saver.sh


# for markdonw preview
npm -g install instant-markdown-d

#utility for deploying ios test applications
npm install -g ios-deploy

#global git setup
git config --global user.name "n.wagensonner"
git config --global user.email "n.wagensonner@manyminds.de"
git config --global push.default simple

#install cask for brew
brew install caskroom/cask/brew-cask

#install closed source applications
brew cask install iterm2
brew cask install dropbox
brew cask install vlc
brew cask install virtualbox
brew cask install menumeters
brew cask install vagrant
brew cask install seil 
brew cask install smoothmouse
source ~/.bash_profile

sudo gem install lunchy

#installing vim dependencies
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s `pwd`/nvimrc ~/.nvimrc
ln -s `pwd`/vimrc ~/.vimrc
#install all bundled git plugins
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

#faster responses on resume
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
chflags nohidden ~/Library
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

#disable startup sound
sudo nvram SystemAudioVolume=%80

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
