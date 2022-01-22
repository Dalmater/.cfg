##!/data/data/com.termux/files/usr/bin/sh
pkg up -yy && pkg install man ncurses zsh git exa

chsh -s zsh
echo "Changed shell to zsh!"
sleep 2

tput civis
pkg up -yy && pkg install -yy game-repo science-repo unstable-repo shtool \
termux-tools termux-am-socket termux-api readline inetutils bash-completion \
ncdu inxi lua52 lua53 lua54 luajit make pigz lua-lpeg stylua dialog ack-grep \
tmux neofetch command-not-found okc-agents perl golang python2 python tar bc \
git-delta nodejs texinfo neovim android-tools cpufetch build-essential fd pv \
tree moreutils jq gnutls ruby termimage toilet php mpv hors file ranger most \
lesspipe openssh openssl gnupg ncurses-utils lynx clang no-more-secrets mdp \
dash ripgrep gawk elinks chafa micro cmatrix asciinema nano ctags tty-clock \
fzf bat figlet binutils unzip keychain ttyrec w3m silversearcher-ag cowsay \
starship slang wget vitetris help2man xmake bvi jp2a fortune zip p7zip glow \
unrar tar vifm tidy gpgme gotop net-tools htop-legacy openssl-tool sl mlocate links


sleep 1
echo "\033[1;32mPackages installt!"
sleep 3

gem install neovim lolcat

sleep 1
echo "\033[1;32mruby gems installt!"
sleep 3

npm install -g bash-language-server cli-highlight js-beautify lua-fmt neovim npm-fzf pyright vim-language-server

sleep 1
echo "\033[1;32mnpm packages installt!"
sleep 3

$PREFIX/bin/python3 -m pip install --upgrade --force pip neovim pygments speedtest-cli

sleep 1
echo "\033[1;32mpip upgraded!"
sleep 3

$PREFIX/bin/python2 -m pip install --upgrade pip neovim

sleep 1
echo "\033[1;32mPython2 pip upgraded!"
sleep 3

echo ""
clear
figlet -f wideterm "All Termux packages installt\!" | lolcat -p 0.5 -d 30 -F 0.2 -s 10 -a -t
echo ""
tput civis

sleep 2
printf '\033[1;4;33mDownloading oh-my-zsh install script with!\033[0m\n'
sleep 1
echo ""
printf "wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh ~/ohmyzsh\n"

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
sh -c "$(\wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
tput cnorm
