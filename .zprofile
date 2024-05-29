export PATH=${HOME}/.local/bin:${PATH}

# Load utils into PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init -)"

# Python-reltaed configs
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
