# ZSH configuration

source ${HOME}/.profile
export PATH="${HOME}/.cargo/bin:${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:/usr/sbin:${PATH}"

# Replace ls by exa
alias ls="exa --sort type --classify"
alias l="exa --sort type --classify"
alias ll="exa --long --icons --sort type --classify"
alias lll="exa --long --icons --all --sort type --classify"
alias la="exa --all --sort type --classify"
alias lla="exa --long --icons --all --sort type --classify"
alias lt="exa --tree --sort type"

# Use Neovim in place of Vim
alias vim="nvim"

# Define color for man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Define a foreground color for autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a89984"

# Fix Scilab to support wayland
alias scilab="LIBGL_ALWAYS_SOFTWARE=1 MESA_GL_VERSION_OVERRIDE=3.0 scilab"

# Load autocompletion in Zsh
autoload -Uz compinit
# Use menu selction to select completion
zmodload -i zsh/complist

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Plugins
source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOME}/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ${HOME}/.zsh/ohmyzsh/lib/completion.zsh
source ${HOME}/.zsh/ohmyzsh/lib/history.zsh

# Launch starship
eval "$(starship init zsh)"

if [ -e /home/illien/.nix-profile/etc/profile.d/nix.sh ]; then . /home/illien/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
