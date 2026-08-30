zstyle :compinstall filename '/home/dinglebarries/.zshrc'
autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

PROMPT_EOL_MARK=""
PS1='%F{blue}%B%~%b%f '

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PS1='%F{green}(SSH)%f '$PS1
fi

# auto sugest
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# commands
mkcd ()
{
	mkdir -p "$1"
	cd "$1"
}

. ~/.zsh/vim_keybinds.zsh
. ~/.zsh/aliases.zsh
. ~/.zsh/env.zsh
