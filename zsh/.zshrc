# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/snap/bin:$HOME/.cargo/bin:/usr/lib/dart/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
	# load a random theme each time oh-my-zsh is loaded, in which case,
		# to know which specific one was loaded, run: echo $RANDOM_THEME
		# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=`whoami`
FZF_BASE="$HOME/.fzf"
export EDITOR="$HOME/bin/nvim"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
	# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
	# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
	# under VCS as dirty. This makes repository status check for large repositories
		# much, much faster.
		# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
	# stamp shown in the history command output.
	# You can set one of the optional three formats:
	# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
	# or set a custom format using the strftime function format specifications,
	# see 'man strftime' for details.
		# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv virtualenvwrapper fzf kubectl calc colorize python rust shrink-path fzf-tab tmux)
ZSH_COLORIZE_STYLE="monokai"

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
function pod_test_id {
	kubectl get pod -n core -l 'role=http,release=canary'  -o jsonpath='{.items[0].metadata.name}'
}

function pod_test {
	local arg context nb usage
	context=prod_core

	usage="-s: use staging (preprod) env. Default is prod.\n"
	usage+="-h: print this help message and exit.\n"

	while getopts 'sh' arg
	do
		case $arg in
			s) context=preprod_core;;
			h) echo $usage && return 0;;
			*) echo $usage && return 1
		esac
	done

	kubectl config use-context $context
	kubectl exec -n core -it `pod_test_id` -c core -- /bin/bash
}

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

function v3_feed {
	local feed
	feed=$1
	echo "Fetching feed $feed...\n"
	curl "http://renderer.core.prod.oxa.internal.lgw.io/v3/catalog/render?feed_id=$feed&output_format=json" | python -m json.tool;
}

function ctlg_history {
	local ctlg source_dir usage
	source_dir=archive

	usage="Download source catalog known history\n"
	usage+="ctlg_history CTLG_ID\n"
	usage+="-x: download errors files\n"
	usage+="-h: print this help message and exit\n"

	ctlg=$1

	while getopts 'x:h' arg
	do
		case $arg in
			x) source_dir=${OPTARG};;
			h) echo $usage && return 0;;
			*) echo $usage && return 1
		esac
	done

	shift $((OPTIND-1))

	save_to=`mktemp -d`
	ctlg_dir=http://internal-httpnas.core.prod.oxa.internal.lgw.io/indexer/${source_dir}/${ctlg}/

	echo downloading from $ctlg_dir...

	curl -L ${ctlg_dir} \
		| grep ".gz" | cut -d'"' -f2 \
		| xargs -P16 -i'%' wget "http://internal-httpnas.core.prod.oxa.internal.lgw.io/indexer/${source_dir}/${ctlg}/%" -O ${save_to}/% -q

	echo unzipping..
	gunzip -r ${save_to}
	cd ${save_to}
}

[ -f .aliases ] && source .aliases

alias gcf!="ga . && gc! --no-edit && gpf"
alias e=$EDITOR
alias v=view
alias lq=ls # because fuck
alias -g JSON="| python -m json.tool"


setopt prompt_subst

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# prefer ripgrep to grep for fzf
if type rg &> /dev/null; then
    # export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*" --glob "!htmlcov/*"'
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_CTRL_T_COMMAND='rg --files --hidden --glob "!htmlcov/*"'
    export FZF_DEFAULT_OPTS="-m"
fi

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_DEFAULT_SESSION_NAME=work

# brew

export TERM=xterm-256color-italic
export ZK_NOTEBOOK_DIR=~/notes
