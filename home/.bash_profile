if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
fi

if [ -f /Library//Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
    source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
fi

complete -W "$(echo `cat ~/.ssh/config | cut -f 2 -d ' ' | \
    sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
