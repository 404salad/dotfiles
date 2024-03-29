# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="cardi\w\a "
else
    PS1="cardi\w\a "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="cardi\w\a "
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias moon='bash ~/scripts/brightness.sh'  
alias obsidian='~/zapps/Obsidian-1.3.5.AppImage &'  
alias firefox='flatpak run org.mozilla.firefox &'
alias firefoxw='/home/thecuber/zapps/firefox/firefox &'
alias cl='clear'
alias start='open'
alias generate='cp -r ~/.templates/$1'
alias runj='bash ~/scripts/runjava.sh'
alias nvim='~/zapps/nvim.appimage'
alias switch="cd /media/sun/0a14f9a0-73b6-4ead-a095-f34a3e497331/home/thecuber"
alias gitx="git add .; git commit ;git push"
alias leet="open https://leetcode.com/ &"
alias sleep="systemctl suspend"
alias find="find . -name"
alias diss="objdump -d -Mintel"
alias copy="xclip -selection clipboard"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# export "PATH=$PATH:/home/thecuber/.cargo/bin"
[[ -d "/opt/yarn-v1.22.19/bin" ]] && PATH="$PATH:/opt/yarn-v1.22.19/bin"
[[ -d "/home/thecuber/Downloads/node-v16.13.0-linux-x64/bin" ]] && PATH="$PATH:/home/thecuber/Downloads/node-v16.13.0-linux-x64/bin"
[[ -d "/home/thecuber/zapps" ]] && PATH="$PATH:/home/thecuber/zapps"
[[ -d "/usr/local/texlive/2023/bin/x86_64-linux" ]] && PATH="$PATH:/usr/local/texlive/2023/bin/x86_64-linux"
[[ -d "/home/thecuber/scripts" ]] && PATH="$PATH/home/thecuber/scripts"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# just rust things
 . "$HOME/.cargo/env"
source "$HOME/.cargo/env"

# elixir package manager
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

echo "ego is the enemy"
