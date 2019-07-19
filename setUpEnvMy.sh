# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure system is ready to brew
brew doctor

# Brew Install basic dev tools
brew install git nodenv yarn jq awscli kubernetes-cli kops remind101/formulae/assume-role terraform bash-completion aws-iam-authenticator

echo "================================================================"
echo "=============  Manage node version with 'nodenv'  =============="
echo "================================================================"
echo " "
echo " nodenv is a tool that allows you to switch between versions of node automaticaly."
echo " In a folder create the '.node-version' file and write the desired version. ie '12.4.0'"
echo " When you run 'node' in this folder, node will run on the desired version"
echo " If you run 'node' and get an error message like that:"
echo " nodenv: version '12.2.0' is not installed"
echo " You have to install this version with: 'nodenv install 12.2.0"
echo " "
echo "================================================================"

# initialise nodenv
echo 'eval "$(nodenv init -)"' >> ~/.bash_profile
nodenv rehash

# Print a list with other software the user might want to install
echo " "
echo " "
echo "================================================================"
echo "= Some additional software you might be insterested to install ="
echo "================================================================"
echo " Slack - https://slack.com "
echo " iTerm - https://www.iterm2.com"
echo " 1Password - https://1password.com/, Dashlane - https://www.dashlane.com or equivalent password manager"
echo " Docker - https://www.docker.com/get-started"
echo " Postman - https://www.getpostman.com or Insomnia - https://insomnia.rest/download or equivalent API testing tool"
echo " WebStorm - https://www.jetbrains.com/webstorm, VS Code - https://code.visualstudio.com , IntelliJ IDEA - https://www.jetbrains.com/idea/download, or your preferred Development IDE. Most of the team use WebStorm for NodeJS dev"
echo " "
echo " "
echo "================================================================"

# Install an awsome version for vimrc from github.com/amix
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install pr kube utility from https://github.com/jonmosco/kube-ps1
brew install kube-ps1

# Install mfa-seesion utilities
git clone git@github.com:mozilla-platform-ops/aws_mfa_scripts.git ~/bin

# Load my environment
echo "source ~/.env_my/bash" >> ~/.bash_profile
source ~/.bash_profile
