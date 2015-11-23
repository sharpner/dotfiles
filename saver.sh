brew cask install aerial

/usr/bin/defaults -currentHost write com.apple.screensaver 'CleanExit' -string "YES"
/usr/bin/defaults -currentHost write com.apple.screensaver 'PrefsVersion' -int "100"
/usr/bin/defaults -currentHost write com.apple.screensaver 'idleTime' -int "300"
/usr/bin/defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "path" -string "/Users/nwagensonner/Library/Screen Savers/Aerial.saver"
/usr/bin/defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "type" -int "0" 
/usr/bin/defaults -currentHost write com.apple.screensaver 'ShowClock' -bool "false"
/usr/bin/defaults -currentHost write com.apple.screensaver 'tokenRemovalAction' -int "0"

killall cfprefsd
