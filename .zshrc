export STARSHIP_CONFIG=~/_projects/_setup/dotfiles/.starship/config.toml

# These are no longer needed, as were for bash, but keeping incase I need to switch back
# source "/Users/ashley.nolan/_projects/_setup/dotfiles/.git-completion.bash"  # Added by git-convenience
# source "/Users/ashley.nolan/_projects/_setup/dotfiles/.git-prompt.sh"  # Added by git-convenience
# source "/Users/ashley.nolan/_projects/_setup/dotfiles/.terminal-prefs.sh"  # Added by git-convenience
source "/Users/ashley.nolan/_projects/_setup/dotfiles/.git-shortcuts.sh"  # Added by git-convenience

source "/Users/ashley.nolan/_projects/_setup/dotfiles/.yarn-shortcuts.sh"  # yarn shortcuts

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

source ~/_zshplugins/z.sh # searching via zsh-z :: https://github.com/agkozak/zsh-z
source ~/_projects/_setup/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh # autocomplete via :: https://github.com/zsh-users/zsh-autosuggestions

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Enable corrections
setopt CORRECT
setopt CORRECT_ALL

# Enable search based on what has been typed so far
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

eval "$(starship init zsh)"

# Add NPM Global packages to PATH
export PATH="$HOME/.npm-packages/bin:$PATH"