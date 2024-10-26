export PATH=${HOME}/.local/bin:${PATH}

# Bootstrap utils...
if [ -f /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/unicorn.omp.json)"
fi

eval "$(pyenv init -)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Python-related configs
export POETRY_VIRTUALENVS_IN_PROJECT=true
export POETRY_VIRTUALENVS_PREFER_ACTIVE_PYTHON=true

# Java-related configs
export JAVA_HOME=/opt/java/current

# GoLang-related configs
export GOENV_ROOT=${HOME}/.goenv
export PATH=${GOENV_ROOT}/bin:${PATH}
eval "$(goenv init -)"
export PATH=${GOROOT}/bin:${PATH}
export PATH=${PATH}:${GOPATH}/bin

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

change_theme () {
	eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/$1.omp.json)"
}

