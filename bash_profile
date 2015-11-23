username="34m"
hostname="33m"
wd="36m"
PS1="\[\033[1m\]\[\033[$username\]\u\[\033[37m\]@\[\033[1m\]\[\033[$hostname\]\h\[\033[0m\][\[\033[$wd\]\w\[\033[0m\]] \[\033[36m\]\\$ \[\033[0m\]"

[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

export GOPATH=~/Development/Go
export GOBIN=~/Development/Go/bin

export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:~/bin
export PATH=$GOBIN:/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# utility commands
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

#suspend on afk
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# aliases
alias map="xargs -n1"
alias gop='cd $GOPATH'
alias ll='ls -l'
alias lld='ls -lF | grep '^d''

alias vnc='open /System/Library/CoreServices/Applications/Screen\ Sharing.app/'
alias top="top -o cpu"

