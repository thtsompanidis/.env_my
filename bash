# Add `~/bin` to the `$PATH`
  [[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH";

# autocompletion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#set GOPATH 
export GOPATH=$(which go)

# set the prompt
function parse_git_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
 export PS1="\e[0m\$(kube_ps1) \[\033[01;34m\]\$(parse_git_branch) \e[46m\e[33m\W\e[49m \[\e[36m\w\[\e[0m\] --- \[\033[01;35m\]\u@mac \[\033[01;32m\]\t \[\e[0m\]\!\[\033[01;34m\]\n>\[\e[0m\]"

function aws-start-session() { eval $( mfa-start-session $@); }
function aws-assume-role() { eval $( assume-role $@); }

source ~/.env_my/aliases

