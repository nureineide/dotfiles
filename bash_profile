# vim:ft=sh

set -o vi

source ~/.dotfiles/shell/alias
source ~/.dotfiles/shell/env.bash
source ~/.dotfiles/shell/rbenv-completion.bash
source ~/.dotfiles/shell/functions.bash
source ~/.dotfiles/shell/prompt.bash
source ~/.dotfiles/shell/git-completion.bash
source ~/.dotfiles/shell/pip-completion.bash
source ~/.dotfiles/shell/ssh-completion.bash
source ~/.dotfiles/shell/knife-completion.bash
source ~/.dotfiles/shell/homebrew-completion.bash
source ~/.dotfiles/shell/trousseau-completion.bash
source ~/.dotfiles/autoenv/activate.sh

source ~/.dotfiles/shell/ssh-agent.bash
source ~/.dotfiles/shell/gpg.bash

[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
[ -f /Users/benjamin/.travis/travis.sh ] && source /Users/benjamin/.travis/travis.sh

eval "$(tmuxifier init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
