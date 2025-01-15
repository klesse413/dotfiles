### BEGIN STRIPE
# All Stripe related shell configuration
# is at ~/.stripe/shellinit/bash_profile and is
# persistently managed by Chef. You shouldn't
# remove this unless you don't want to load
# Stripe specific shell configurations.
#
# Feel free to add your customizations in this
# file (~/.bash_profile) after the Stripe config
# is sourced.
if [[ -f ~/.stripe/shellinit/bash_profile ]]; then
  source ~/.stripe/shellinit/bash_profile
fi
### END STRIPE

# START - Managed by chef cookbook stripe_cpe_bin
alias tc='/usr/local/stripe/bin/test_cookbook'
alias cz='/usr/local/stripe/bin/chef-zero'
alias cookit='tc && cz'
# STOP - Managed by chef cookbook stripe_cpe_bin

# subl
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

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
alias ps="cd ~/stripe/pay-server"
alias vsc="code --new-window ~/stripe/pay-server"
alias gci="git commit"
alias gco="git checkout"
alias gs="git status"
