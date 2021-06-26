# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
#[[ $TERM != screen* ]] && exec tmux
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -la --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias proj='cd /home/user/projects'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
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

quikfind(){
# Usage: quikfind
quikfind_=$(cat <<DOCUMENT
  █████   █    ██  ██▓ ██ ▄█▀  █████▒██▓ ███▄    █ ▓█████▄ 
▒██▓  ██▒ ██  ▓██▒▓██▒ ██▄█▒ ▓██   ▒▓██▒ ██ ▀█   █ ▒██▀ ██▌
▒██▒  ██░▓██  ▒██░▒██▒▓███▄░ ▒████ ░▒██▒▓██  ▀█ ██▒░██   █▌
░██  █▀ ░▓▓█  ░██░░██░▓██ █▄ ░▓█▒  ░░██░▓██▒  ▐▌██▒░▓█▄   ▌
░▒███▒█▄ ▒▒█████▓ ░██░▒██▒ █▄░▒█░   ░██░▒██░   ▓██░░▒████▓ 
░░ ▒▒░ ▒ ░▒▓▒ ▒ ▒ ░▓  ▒ ▒▒ ▓▒ ▒ ░   ░▓  ░ ▒░   ▒ ▒  ▒▒▓  ▒ 
 ░ ▒░  ░ ░░▒░ ░ ░  ▒ ░░ ░▒ ▒░ ░      ▒ ░░ ░░   ░ ▒░ ░ ▒  ▒ 
   ░   ░  ░░░ ░ ░  ▒ ░░ ░░ ░  ░ ░    ▒ ░   ░   ░ ░  ░ ░  ░ 
    ░       ░      ░  ░  ░           ░           ░    ░    
                                                    ░      
DOCUMENT
)
printf "${quikfind_}\n"
read -p "Enter Filename: " filename
find /sdcard/ | grep ${filename}
}

fbvid(){
# Usage: fbvid "POST_URL"
if test -d ~/fbvid; then
        true
else
        mkdir ~/fbvid
fi
if test -d ~/fbvid/output; then
        true
else
        mkdir ~/fbvid/output
fi
cd ~/fbvid
url="$1"
youtube-dl -F ${url}
read -p "audio format: " fbaudio
read -p "video format: " fbvideo
audioext="m4a"
videoext="mp4"
echo -e "[fbvid] url: ${url}"
echo -e "[fbvid] downloading the audio..."
youtube-dl -f ${fbaudio} ${url}
echo -e "[fbvid] downloading the video..."
youtube-dl -f ${fbvideo} ${url}
ex=(${url//\// })
audiofile="$(ls | grep ${audioext})"
videofile="$(ls | grep ${videoext})"
echo -e "[fbvid] add the audio to the video..."
ffmpeg -i "${videofile}" -i "${audiofile}" -c:v copy -map 0:v:0 -map 1:a:0 -c:a aac -b:a 192k "${ex[4]}.${videoext}"
rm "${audiofile}"
rm "${videofile}"
mv "${ex[4]}.${videoext}" output
echo -e "[fbvid] done. output: output/${ex[4]}.${videoext}"
}

readme() {
# Usage: readme user repos
curl https://raw.githubusercontent.com/$1/$2/master/README.md
}

iconset() {
# Usage: iconset project_name icon.png
if test ! -d $HOME/appicon; then
	mkdir $HOME/appicon
fi
hdpi="/sdcard/AppProjects/$1/app/src/main/res/drawable-hdpi"
mdpi="/sdcard/AppProjects/$1/app/src/main/res/drawable-mdpi"
xhdpi="/sdcard/AppProjects/$1/app/src/main/res/drawable-xhdpi"
xxhdpi="/sdcard/AppProjects/$1/app/src/main/res/drawable-xxhdpi"
rm ${hdpi}/ic_launcher.png
rm ${mdpi}/ic_launcher.png
rm ${xhdpi}/ic_launcher.png
rm ${xxhdpi}/ic_launcher.png
cp $2 $HOME/appicon/ic_launcher.png
cp $HOME/appicon/ic_launcher.png ${hdpi}
cp $HOME/appicon/ic_launcher.png ${mdpi}
cp $HOME/appicon/ic_launcher.png ${xhdpi}
cp $HOME/appicon/ic_launcher.png ${xxhdpi}
}
