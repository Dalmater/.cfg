#!/data/data/com.termux/files/usr/bin/bash
pkg up -yy && pkg install -y man ncurses-utils zsh git exa starship

chsh -s zsh
echo "Changed shell to zsh!"
sleep 2

tput civis
pkg up -y && pkg install -yy lua-language-server nala \
termux-am-socket termux-api dnsutils inetutils bash-completion traceroute \
inxi shtool lua53 lua54 luajit lua-lpeg stylua dialog ack-grep make mdp \
tmux neofetch command-not-found okc-agents perl mlocate python2 python-pip \
git-delta nodejs jq texinfo neovim cpufetch build-essential fd rsync tar \
tree moreutils gnutls ruby termimage toilet ncdu mpv file ranger bvi pv \
lesspipe openssl gnupg lynx clang no-more-secrets pigz onefetch sd most \
dash ripgrep gawk elinks chafa micro cmatrix asciinema nano ctags tty-clock \
fzf bat figlet unzip keychain net-tools ttyrec w3m silversearcher-ag cowsay \
starship slang wget help2man xmake tar jp2a fortune zip p7zip glow binutils \
unrar strace ipmitool util-linux e2fsprogs vifm gpgme htop sl bc 2048-c


sleep 1
echo "\033[1;32mPackages installt!"
sleep 3

gem install neovim lolcat ruby-beautify

sleep 1
echo "\033[1;32mruby gems installt!"
sleep 3

npm install -g cli-highlight js-beautify lua-fmt neovim npm-fzf prettier remark-cli \
  vim-language-server bash-language-server fixjson css-language-server eslint

sleep 1
echo "\033[1;32mnpm packages installt!"
sleep 3

$PREFIX/bin/python2 -m pip install neovim

sleep 1

$PREFIX/bin/python3 -m pip install --upgrade --force pip

pip install neovim pyls yapf pygments speedtest-cli grip

sleep 1
echo "\033[1;32mPhython packages installed!"
sleep 3

if [ ! -d "$XDG_CONFIG_HOME/tmux/plugins" ]; then
  mkdir "$XDG_CONFIG_HOME/tmux/plugins"
  git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm" \
    && echo "Tmux plugin manager installed!"
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d "$XDG_DATA_HOME/nvim/plugged" ]; then
  mkdir $XDG_DATA_HOME/nvim/plugged
fi

cd $XDG_DATA_HOME/nvim/plugged

git clone https://github.com/itchyny/lightline.vim ~/.local/share/nvim/plugged/lightline.vim
cp ~/.config/nvim/backups/lightline-gruvbox.vim  ~/.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/gruvboxdark.vim

echo ""
clear
figlet -f wideterm "All Termux packages installt\!" | lolcat -p 0.5 -d 30 -F 0.2 -s 10 -a -t
echo ""
tput civis

sleep 2
printf '\033[1;4;33mDownloading oh-my-zsh install script via\033[0m\n'
sleep 1
echo ""
printf "wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh ~/ohmyzsh\n"

echo ""
printf "\033[0;30mAfter the install script is downloaded,\n" | lolcat -a -d 30 -s 10 -t -i -F 0.2
tput civis
printf "\033[1;4;7;33;48mcheck the 'ohmyzsh/install.sh' script and execute with \033[4;1;41msh install.sh or ./install.sh!\033[0m\n"
sleep 1
echo ""
printf "\033[0;33mPress Ctrl-C or wait 10 sec to install it!\033[0m\n"
sleep 1
echo ""

count_down=9
echo ""
while [ ${count_down} -ge 0 ]; do
  printf "\rYou have \033[1;31m${count_down}\033[0m seconds, hit Ctrl+C to cancel installation!"
  sleep 1
  count_down=$((${count_down} - 1))
done
sleep 1
echo -n " "

printf "\033[1;31mScript installation starting!\n"
echo ""
sleep 2
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh ~/.zsh)"
tput cnorm
