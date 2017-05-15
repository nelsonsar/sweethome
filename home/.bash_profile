if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
fi

if [ -f /Library//Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
    source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
fi

alias vi="/usr/local/bin/vim"

export CLICOLOR=1
export TERM=xterm-256color
