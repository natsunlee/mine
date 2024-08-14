export PATH=${HOME}/.local/bin:${PATH}

# Bootstrap utils...
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init -)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Python-related configs
export POETRY_VIRTUALENVS_IN_PROJECT=true
export POETRY_VIRTUALENVS_PREFER_ACTIVE_PYTHON=true

# Java-related configs
export JAVA_HOME=/opt/java/current

# Misc build configs
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/libpq/include"

# Set session/tab title to current dir here rather than configure per-terminal app
DISABLE_AUTO_TITLE="true"
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# Aliases
alias ls='eza'
alias cat='bat'
alias cd='z'
