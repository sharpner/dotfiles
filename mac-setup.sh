#prompt xcode developer tools
xcode-select --install

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

#install fonts
cp font/*.otf ~/Library/Fonts/

#install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update

#install brew dependencies
brew install wget
brew install mongodb
brew install go
brew install git
brew install vim --override-system-vi --with-python3
brew install npm
brew install irssi 

#global git setup
git config --global user.name "n.wagensonner"
git config --global user.email "n.wagensonner@manyminds.de"

#install cask for brew
brew install caskroom/cask/brew-cask

#install closed source applications
brew cask install google-chrome
brew cask install iterm2
brew cask install dropbox
brew cask install vlc
brew cask install gpgtools
brew cask install istat-menus

source ~/.bash_profile

#installing vim dependencies
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s `pwd`/vimrc ~/.vimrc
#install all bundled git plugins
vim +PluginInstall +qall

#go deps
go get code.google.com/p/rog-go/exp/cmd/godef
go get code.google.com/p/go.tools/cmd/cover
go get code.google.com/p/go.tools/cmd/godoc
go get code.google.com/p/go.tools/cmd/vet

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

echo "All done. "
echo "Install your private key file to ~/.ssh/id_rsa"
