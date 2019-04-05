# Set Path
set -gx PATH /home/pentecostjonathan/src/bin/pacmbin $PATH
set -gx PATH /home/pentecostjonathan/src/go/bin $PATH
set -gx PATH /home/pentecostjonathan/go/bin $PATH
set -gx PATH /home/pentecostjonathan/.cargo/bin $PATH

# Aliases
alias k "kubectl"
alias kc "kubectl config current-context"

alias t "tmux"

alias ch "cd ~/src/coral-health"
alias gov "cd ~/go/src/github.com/vishen"

alias gcav "gcloud config set account pentecostjonathan@gmail.com ;and gcloud config list"

alias gcv_admin "gcloud config set project vishen-admin ;and gcav"
