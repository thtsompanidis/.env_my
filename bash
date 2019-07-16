# Add `~/bin` to the `$PATH`
  [[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH";

#kubectl autocompletion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
#source <(kubectl completion bash)

function move_to_temp {
    filename=$1
    bname=$(basename $filename)
    if [ ! -f "$filename" ]; then
        echo "File '$filename' not found!"
    else
        path=$(cd "$(dirname "$filename")" && pwd)/$(basename "$filename")
        echo "Original path: $path" | cat - "$filename" > .temporary_file.txt && mv .temporary_file.txt "/Users/ttsompanid001/temp/$bname"
        rm -f $filename
        echo "$filename moved in ~/temp"
    fi
}

function parse_git_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
export PS1="\! \$(kube_ps1)\[\033[01;32m\]\t \[\033[01;35m\]\u@mac\[\033[01;34m\]:\$(parse_git_branch) \[\033[01;32m\]\w \[\033[01;34m\]\n>\[\e[0m\]"

function ecr-login() { eval $(aws --region us-east-1 ecr get-login --no-include-email);}
function aws-start-session() { eval $( mfa-start-session $@); }
function aws-assume-role() { eval $( assume-role $@); }

source ~/.env_my/aliases
source ~/.env_my/vars

