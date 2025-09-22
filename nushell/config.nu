# version = "0.106.1"
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.path ++= [
  "/opt/homebrew/bin",
  "/usr/local/go/bin",
  "/Users/elikya/go/bin",
  "/Users/elikya/.bun/bin"
]
$env.config.buffer_editor = "hx"
$env.config.show_banner = false
use ~/.cache/starship/init.nu
source ~/.zoxide.nu
source ~/.local/share/atuin/init.nu
source ~/.cache/carapace/init.nu
source ~/Dev/dotfiles/nushell/scripts.nu
source ~/Dev/dotfiles/nushell/theme.nu
source $"($nu.home-path)/.cargo/env.nu"
alias ll = ls **/*
alias gpo = git_commit_push
alias gpr = gh_pr_create_and_merge
alias zj = zellij
alias zd = z_ls
alias zdi = zi_ls
pfetch
