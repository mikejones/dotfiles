if [ -f ~/.git-completion ]; then
  source ~/.git-completion
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '

export EDITOR="mate -w"

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
export HADOOP_HOME=/Users/michaeljones/src/hadoop-0.20.1
 
export PATH=$HADOOP_HOME/bin:$PATH

# add mysql & ports to path
export PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH"

function authme { 
ssh $1 'cat >>~/.ssh/authorized_keys' <~/.ssh/id_dsa.pub 
}

_mategem()
{
    local curw
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    local gems="$(gem environment gemdir)/gems"
    COMPREPLY=($(compgen -W '$(ls $gems)' -- $curw));
    return 0
}
complete -F _mategem -o dirnames mategem

if [[ -s /Users/michaeljones/.rvm/scripts/rvm ]] ; then source /Users/michaeljones/.rvm/scripts/rvm ; fi

