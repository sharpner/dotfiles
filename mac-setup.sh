#settings
echo "Input hostname for this machine"
read hostname

if [ -z "$hostname" ] ; then
  echo "Hostname must be set."
  exit 1
fi 

#create folder structure
mkdir -p ~/Development/Go
mkdir -p ~/.ssh/
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo

#install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update

#install brew dependencies
brew install wget
brew install mongodb
brew install go
brew install git
brew install vim --override-system-vi --with-python3

#install cask for brew
brew install caskroom/cask/brew-cask

#install closed source applications
brew cask install google-chrome
brew cask install iterm2
brew cask install dropbox
brew cask install vlc
brew cask install gpgtools

#installing vim dependencies
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

#go deps
go get -v code.google.com/p/rog-go/exp/cmd/godef
go get -v code.google.com/p/go.tools/cmd/cover

#configure system
sudo scutil --set ComputerName $hostname
sudo scutil --set HostName $hostname
sudo scutil --set LocalHostName $hostname
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $hostname

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
