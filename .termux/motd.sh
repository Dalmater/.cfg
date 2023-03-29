#!/data/data/com.termux/files/usr/bin/bash

# Setup TERMUX_APP_PACKAGE_MANAGER
source "/data/data/com.termux/files/usr/bin/termux-setup-package-manager" || exit 1

terminal_width="$(stty size | cut -d" " -f2)"
if [[ "$terminal_width" =~ ^[0-9]+$ ]] && [ "$terminal_width" -gt 52 ]; then

    motd="
 \e[47m                \e[0m  \e[1mWelcome to Termux!\e[0m
 \e[47m  \e[0m            \e[0;37m\e[47m .\e[0m
 \e[47m  \e[0m  \e[47m  \e[0m        \e[47m  \e[0m  \e[1;33mDocs:\e[0m      \e[4mtermux.dev/docs\e[0m
 \e[47m  \e[0m  \e[47m  \e[0m        \e[47m  \e[0m  \e[1;34mDonate:\e[0m    \e[4mtermux.dev/donate\e[0m
 \e[47m  \e[0m            \e[47m  \e[0m  \e[1;36mCommunity:\e[0m \e[4mtermux.dev/community\e[0m
 \e[47m  \e[0m            \e[0;37m\e[47m .\e[0m
 \e[47m                \e[0m  \e[1mTermux version:\e[0m ${TERMUX_VERSION-Unknown}
"

    motd_indent="                   "

else

    motd="
\e[1mWelcome to Termux!\e[0m

\e[1;33mDocs:\e[0m      \e[4mhttps://termux.dev/docs\e[0m
\e[1;34mDonate:\e[0m    \e[4mhttps://termux.dev/donate\e[0m
\e[1;36mCommunity:\e[0m \e[4mhttps://termux.dev/community\e[0m

\e[1mTermux version:\e[0m ${TERMUX_VERSION-Unknown}
"

    motd_indent=""
fi

motd+="
${motd_indent}\e[1mWorking with packages:\e[0m
${motd_indent}\e[1;32mSearch:\e[0m  pkg search <query>
${motd_indent}\e[1;32mInstall:\e[0m pkg install <package>
${motd_indent}\e[1;32mUpgrade:\e[0m pkg upgrade
"


if [ "$TERMUX_APP_PACKAGE_MANAGER" = "apt" ]; then

    motd+="
${motd_indent}\e[1mSubscribing to additional repos:\e[0m
${motd_indent}\e[1;31mRoot:\e[0m pkg install root-repo
${motd_indent}\e[1;31mX11:\e[0m  pkg install x11-repo

${motd_indent}For fixing any repository issues,
${motd_indent}try '\e[0;32mtermux-change-repo\e[0m' command.
"

fi

motd+="
${motd_indent}\e[33mReport issues\e[0m at \e[4mtermux.dev/issues\e[0m
"

echo -e "$motd"
