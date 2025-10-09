autoload -U compinit
compinit -i

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

DEFAULT_USER=`whoami`
FZF_BASE="$HOME/.fzf"
export BAT_THEME="Catppuccin Mocha"
export EDITOR="nvim"
export TERMINAL="wezterm"
export MANPAGER="nvim --appimage-extract-and-run +Man!"
# export TERM="tmux-256color"

plugins=(git virtualenv fzf kubectl colorize python rust shrink-path fzf-tab tmux task)
ZSH_COLORIZE_STYLE="monokai"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
	# if [[ -n $SSH_CONNECTION ]]; then
		#   export EDITOR='vim'
		# else
			#   export EDITOR='mvim'
			# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


function csv {
	local delimiter file usage
	delimiter=";"
	usage="Print CSV in console\n"
	usage+="csv CSV_FILE\n"
	usage+="-d: specify a delimiter\n"
	usage+="-h: print this help message and exit.\n"

	while getopts 'd:h' arg
	do
		case $arg in
			d) delimiter=${OPTARG};;
			h) echo $usage && return 0;;
			*) echo $usage && return 1
		esac
	done
	shift $((OPTIND-1))
	file=$1
	cat $1 | sed -e 's/$delimiter$delimiter/$delimiter $delimiter/g' | column -s$delimiter -t | less -#5 -N -S
}

[ -f .aliases ] && source .aliases

export RIPGREP_CONFIG_PATH=$HOME/.rg

setopt prompt_subst


# prefer ripgrep to grep for fzf
if type rg &> /dev/null; then
    # export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*" --glob "!htmlcov/*"'
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_CTRL_T_COMMAND='rg --files --hidden --glob "!htmlcov/*"'
    export FZF_DEFAULT_OPTS="-m"
fi

# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_DEFAULT_SESSION_NAME=work

export NVIM_TUI_ENABLE_TRUE_COLOR=1
export ZK_NOTEBOOK_DIR="$HOME/notes"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.cargo/env ] && source ~/.cargo/env

function prco() {
	# checkout pr
	gh pr list --json number,title,headRefName,author --limit 500 | jq -r '.[] | [.number, .title, .author.login, .headRefName] | @tsv' | column -ts $'\t' | fzf | cut -f1 -d" " | xargs gh pr checkout
}

eval "$(op completion zsh)"; compdef _op op
eval "$(zoxide init zsh)"

[ -f "/home/vianney/.ghcup/env" ] && source "/home/vianney/.ghcup/env" # ghcup-env


. "$HOME/.local/bin/env"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

eval "$(starship init zsh)"
