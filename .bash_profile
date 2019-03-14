source ~/.bashrc

# for rbenv
eval "$(rbenv init -)"

# for dox
alias dox_prod="ssh prod-doximity-console.dox.box"
alias finder_prod="ssh prod-finder-console.dox.box"
alias pages_prod="ssh prod-pages-console.dox.box"
alias eda_prod="ssh prod-email-delivery-console.dox.box"
alias es_prod_tunnel="ssh -L 5443:elasticsearch.dox.box:9200 dnill@aws-bastion -N"
alias cm_prod="ssh prod-career-match-console.dox.box"
alias cc_prod="ssh prod-colleague-connect-console.dox.box"
alias jl_prod="ssh prod-job-listings-console.dox.box"
alias staging-chamber='AWS_REGION=us-east-1 CHAMBER_KMS_KEY_ALIAS=staging-parameter-store aws-vault exec legacy -- chamber'
alias pre-chamber='AWS_REGION=us-east-1 CHAMBER_KMS_KEY_ALIAS=pre-parameter-store aws-vault exec hipaa -- chamber'
alias prod-chamber='AWS_REGION=us-east-1 CHAMBER_KMS_KEY_ALIAS=prod-parameter-store aws-vault exec hipaa -- chamber'

# dox-compose
eval "$("/Users/daniel/projects/doximity/dox-compose/bin/dox-init")"
alias dce="dox-dc exec ${PWD##*/}"
alias docker-sync-restart="(cd ~/projects/doximity/dox-compose && docker-sync stop && docker-sync start)" 
alias dc-start-app="dox-dc up -d ${PWD##*/} && dox-dc logs -f --tail=25 ${PWD##*/}"
alias dc-rspec="dce bundle exec rspec"

# for bundler
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"

# homebrew
export PATH="/usr/local/bin:${PATH}"

# for postgresql
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# for redis
alias redis-server-start="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-server-stop="launchctl stop ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

# git
alias g="git"

# for rails
alias rails_tail="tail -f log/development.log"
export DISABLE_SPRING=1

# quick python server
alias server="python -m SimpleHTTPServer"

# bash
alias ls="ls -la"
alias psgrep="ps aux | grep"
alias grep="grep --color"


#bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

# Make g alias for git work with autocomplete.
# brew install bash-completion
complete -o default -o nospace -F _git g

# display git branch
#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
IRed="\[\033[0;91m\]"         # Red
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\W"
PathFull="\w"
NewLine="\n"
Jobs="\j"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# function to make and directory and cd into it in a single command
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better
export PS1=$IBlack$Time12h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
 echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
 if [ "$?" -eq "0" ]; then \
   # @4 - Clean repository - nothing to commit
   echo " '$Blue$PathFull$Green'"$(parse_git_branch); \
 else \
  # @5 - Changes to working tree
   echo " '$Blue$PathFull$IRed'"$(parse_git_branch); \
 fi) '$Yellow'⚡'$Color_Off' "; \
else \
 # @2 - Prompt when not in GIT repo
 echo " '$Blue$PathFull$Yellow' ⚡'$Color_Off' "; \
fi)'

# File Highlighting
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# elastic search
alias elastic_search_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist"
alias elastic_search_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist"
export STDOUT_ES=true

# for golang
export GOPATH=$HOME/projects/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:${GOPATH//://bin:}/bin
export PATH=$PATH:$GOROOT/bin

# for emscripten
# note this needs to be updated if the sdk is moved
export PATH=$PATH:/Users/Daniel/Downloads/emsdk_portable:/Users/Daniel/Downloads/emsdk_portable/clang/e1.27.0_64bit:/Users/Daniel/Downloads/emsdk_portable/node/0.10.18_64bit/bin:/Users/Daniel/Downloads/emsdk_portable/emscripten/1.27.0

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# for nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion# for nvm

