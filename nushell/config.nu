# version = "0.106.1"
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.path ++= ["/opt/homebrew/bin"]
$env.config.buffer_editor = "hx"
$env.config.show_banner = false
use ~/.cache/starship/init.nu
source ~/.zoxide.nu
source ~/.local/share/atuin/init.nu
source ~/.cache/carapace/init.nu
source ~/Dev/dotfiles/nushell/scripts.nu
source ~/Dev/dotfiles/nushell/theme.nu
alias ll = ls **/*
alias gpm = git_commit_push
pfetch
