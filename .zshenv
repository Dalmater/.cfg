# zmodload zsh/zprof

# XDG Path
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
# export TMP_CACHE=$PREFIX/tmp/zsh_tmp_cache

ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

# export SYSTEM=$(uname -s)

# https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zshenv
# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Home-made scripts
export PATH=${HOME}/bin:${HOME}/.local/bin:$PATH
