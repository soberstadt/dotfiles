alias ..='cd ..'

# git commands
alias gs="git status"
alias gc="git commit -a -v"
alias gb="git branch"
alias gba="git branch -a"
alias gd="git diff"
alias gl="git pull; git submodule update"
alias gp="git push"
alias gph="git push heroku master"
alias go="git checkout"
alias ga="git add --all ."
alias gw='git whatchanged -p --abbrev-commit --pretty=medium'
alias git-fancy-branches="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

# alias git="hub"
function git(){hub $@}

function gitshout() {
  git commit -m "$1"
  git push -u
}

alias b="bundle"
alias bi="b install --without=production"
alias biv="b install --path vendor --without=production"
alias bu="b update"
alias be="b exec"

alias yolo='git commit -m "$(curl -s whatthecommit.com/index.txt)"'

alias y='youtube-dl --output "~/Desktop/%(title)s-%(id)s.%(ext)s"'
alias youtube-dl='youtube-dl --format="[width<=?1920]" --no-mtime --restrict-filenames'

alias mpdx_prod='prod-console --docker-args="-e DEV_USER_ID=a5a5b1a9-f373-47c7-80e5-52665c574f2d -e DEV_ACCOUNT_LIST_ID=87dcf0c9-3152-413f-ba7a-f98174c502b4 -e DATADOG_TRACE=false"'
alias mpdx_stage='stage-console --docker-args="-e DEV_USER_ID=a5a5b1a9-f373-47c7-80e5-52665c574f2d -e DEV_ACCOUNT_LIST_ID=87dcf0c9-3152-413f-ba7a-f98174c502b4 -e DATADOG_TRACE=false"'

alias split-vim='tmux split-window vim'
alias keep-trying="echo 'while !!; do :; done' | pbcopy && echo 'copied command to clipboard!'"
alias rubocop_diff="git diff --name-only master | xargs ls -1 2>/dev/null | grep '\.rb$' | grep -v 'db/schema.rb' | xargs bin/rubocop -a"

