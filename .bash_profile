# subl
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# use bash without getting yelled at
export BASH_SILENCE_DEPRECATION_WARNING=1

# git tab complete branch
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# git branch/status in command line prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
export PS1='\[\e[\033[01;34m\]\u@\h \[\e[38;5;211m\]\W\[\e[\033[38;5;48m\] $(parse_git_branch)\[\e[\033[00m\]\$ '

# aliases
alias gci="git commit"
alias gco="git checkout"
alias gs="git status"
