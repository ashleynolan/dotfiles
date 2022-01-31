source ~/.profile

# for running asp.NET with MicroSoft Code
source dnvm.sh
export MONO_MANAGED_WATCHER=disabled

source ~/.customEnvironmentVars

# Add `~/bin` to the `$PATH`
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Add NPM Global packages to PATH
export PATH="$HOME/.npm-packages/bin:$PATH"


#alias for sublime opening from command line
alias sublime="open -a /Applications/Sublime\ Text.app"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

#my extra source files
source "/Users/ashley.nolan/_projects/_setup/dotfiles/.git-completion.bash"  # Added by git-convenience
source "/Users/ashley.nolan/_projects/_setup/dotfiles/.git-prompt.sh"  # Added by git-convenience
source "/Users/ashley.nolan/_projects/_setup/dotfiles/.terminal-prefs.sh"  # Added by git-convenience
source "/Users/ashley.nolan/_projects/_setup/dotfiles/.git-shortcuts.sh"  # Added by git-convenience

source "/Users/ashley.nolan/_projects/_setup/dotfiles/.yarn-shortcuts.sh"  # yarn shortcuts


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/sbin:$PATH"

# set up z.sh
. ./_bash_plugins/z.sh