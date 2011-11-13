if [ -f ~/.git-completion ]; then
  source ~/.git-completion
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.resty/resty ]; then
  source ~/.resty/resty
fi

export GEM_EDITOR='mvim'
export EDITOR="vim"

# colour terminal and add git branch name
export CLICOLOR=1
export LS_COLORS=exfxcxdxbxegedabagacad
export PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '

export CLOJURESCRIPT_HOME=/usr/local/clojurescript
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

function authme { 
ssh $1 'cat >>~/.ssh/authorized_keys' <~/.ssh/id_dsa.pub 
}

if [[ -s /Users/michaeljones/.rvm/scripts/rvm ]] ; then source /Users/michaeljones/.rvm/scripts/rvm ; fi

export PATH="$HOME/.rbenv/bin:$PATH"

