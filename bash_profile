username="34m"
hostname="33m"
wd="36m"
PS1="\[\033[1m\]\[\033[$username\]\u\[\033[37m\]@\[\033[1m\]\[\033[$hostname\]\h\[\033[0m\][\[\033[$wd\]\w\[\033[0m\]] \[\033[36m\]\\$ \[\033[0m\]"

[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

export GOPATH=/Users/nwagensonner/Develop/Go
export GOBIN=/Users/nwagensonner/Develop/Go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$GOBIN:/usr/local/bin/:/usr/local/sbin:/Users/nwagensonner/bin:$PATH

# aliases
alias gop='cd $GOPATH'
alias ll='ls -l'

# git aliases
alias gpr='git pull --rebase'
