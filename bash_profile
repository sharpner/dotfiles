username="34m"
hostname="33m"
wd="36m"
PS1="\[\033[1m\]\[\033[$username\]\u\[\033[37m\]@\[\033[1m\]\[\033[$hostname\]\h\[\033[0m\][\[\033[$wd\]\w\[\033[0m\]] \[\033[36m\]\\$ \[\033[0m\]"

[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

export GOPATH=/Users/nwagensonner/Development/Go
export GOBIN=/Users/nwagensonner/Development/Go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/Users/nwagensonner/bin
export PATH=$GOBIN:/usr/local/bin:/usr/local/sbin:/Users/nwagensonner/bin:$PATH

# utility commands
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias map="xargs -n1"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# aliases
alias gop='cd $GOPATH'
alias ll='ls -l'
alias lld='ls -lF | grep '^d''

# git aliases
alias gpr='git pull --rebase'


#toolmanager settings
export TM_BUCKET_UUID=4983F680-1B8B-4C46-9E2B-D6E0DF9D61D9
export TM_UNIVEDO_URI=ws://localhost:9011
export TM_PERSPECTIVE_UUID=9a0baf58-1922-4c89-8b16-c45ab3e66163
export TM_SERVER_PORT=5000
