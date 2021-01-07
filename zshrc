 # Shell Features ############################################################################################
 PS1="$(echo $PS1 | cut -b 15-) %#"
 export ZSH="$HOME/.oh-my-zsh"
 ZSH_THEME="clean"
 ZSH_DISABLE_COMPFIX=true
 source $ZSH/oh-my-zsh.sh
 unsetopt BEEP
 unsetopt HIST_BEEP
 unsetopt LIST_BEEP
 
 plugins=(
	 git
	 docker
	 # zsh-syntax-highlighting
	 zsh-autosuggestions
 )
 
 zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
 
#############################################################################################################

# Variables #################################################################################################
export PATH=$PATH:$HOME/.scripts
export EDITOR='vim'

#############################################################################################################

# VIM/VI-Mode ###############################################################################################
bindkey -v
autoload edit-command-line
zle -N edit-command-line
bindkey '\Ce' edit-command-line
save=$PS1
function zle-line-init zle-keymap-select {
 	if  [ -z "$SSH_CLIENT" ] ||  [ -z "$SSH_TTY" ]; then
		PS1="${${KEYMAP/vicmd/N}/(main|viins)/I} $save"
	else
		s=$(echo $save | cut -b 3-)
		PS1="$(hostname) ${${KEYMAP/vicmd/N}/(main|viins)/I} $s"
	fi
	zle reset-prompt
}

zle -N zle-keymap-select
export KEYTIMEOUT=1

#############################################################################################################

# Aliases and Functions #####################################################################################
unalias grep
alias l='ls'
alias q='exit'
alias vi='vim'
alias k='kubectl'
alias rpicom='killall picom; picom -b'
alias grep='grep --color=auto'
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias gparted="su -c 'gparted &'"
alias ranger='ranger --choosedir=$HOME/.rangerdir;\
	LASTDIR=`cat $HOME/.rangerdir`;\
	cd "$LASTDIR"'

bindkey -s '\Ch' 'cd\n'
bindkey -s '\Ck' 'cd ..\n'
bindkey -s '^[p' 'popd\n'
bindkey '\Cp' history-substring-search-up
bindkey '\Cn' history-substring-search-down
bindkey -s '\Cv' '$(xclip -selection c -o)'

function chpwd() {
	emulate -L zsh;
	ls
}

# cd() {
# 	builtin cd $*
# 	ls
# }

ecd() {
	dir=$(pwd)
	termite -d "$dir" &; disown
}

xo() {
	if [ $1 = 'e' ]; then
		xdg-open ${@:2} &; disown; exit
	else
		xdg-open ${@:1} &; disown
	fi
}

ydl() {
	youtube-dl --extract-audio --audio-format mp3 $1
}

command_not_found_handler() {
	echo "No such command as \033[1m$1\e[0m"
	return 127
}

if [ -e $HOME/.cache/wal/sequences ]; then
	(cat ~/.cache/wal/sequences &)
fi

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
	(tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux) && exit
fi

source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=false
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#############################################################################################################
#############################################################################################################

PATH="/$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/$HOME/perl5"; export PERL_MM_OPT;
