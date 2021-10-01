#
# Functions
#

#Get IP
ip-addr() {
    wget -qO- http://ipecho.net/plain
    echo
}

# Time ZSH startup
zsh-time() {
    time zsh -i -c exit
}

# uncompress depending on extension...
alias x=extrakt

extrakt() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)
                tar xvjf $1;;
            *.tar.gz)
                tar xvzf $1;;
            *.bz2)
                bunzip2 $1;;
            *.rar)
                unrar x $1;;
            *.gz)
                gunzip $1;;
            *.tar)
                tar xvf $1;;
            *.tbz2)
                tar xvjf $1;;
            *.tgz)
                tar xvzf $1;;
            *.zip)
                unzip $1;;
            *.Z)
                uncompress $1;;
            *.7z)
                7z x $1;;
            *)
                echo "'$1' cannot be extracted via >extrakt<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Make a dir and cd into it
# mkcd() {
#     mkdir -p $1
#     cd $1
# }

# Make directories if it doesn't exist and touch the file
mktouch() {
    mkdir -p `dirname $1`
    touch $1
}

# Rename a file and keep it in the same location
rename() {
    if [ "$#" -ne 2 ]; then
        echo "usage: $0 path/to/file/old_name new_name"
        return
    fi

    mv $1 `dirname $1`/$2
}

# Duplicate a file to a new name in the same location
dup() {
    if [ "$#" -ne 2 ]; then
        echo "usage: $0 path/to/file/file copied_file"
        return
    fi

    cp $1 `dirname $1`/$2
}

# Zsh math function
autoload -U zcalc
function __calc_plugin {
    zcalc -f -e "$*"
}
aliases[calc]='noglob __calc_plugin'
aliases[=]='noglob __calc_plugin'
