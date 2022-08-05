#!/data/data/com.termux/files/usr/bin/env bash
termux_font_main() {
  terminal_color
  termux_font_env
  CATCAT_COLOR=false
  case "$1" in
    h | -h | help | --help | --get-help-info)
      CATCAT_COLOR=true
      get_font_help_info
      ;;
    -n | --no-color)
      ;;
    -num | --number | "")
      choose_termux_font
      ;;
  esac
}
###############
terminal_color() {
  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  PURPLE=$(printf '\033[0;35m')
  CYAN=$(printf '\033[36m')
  BOLD=$(printf '\033[1m')
  RESET=$(printf '\033[m')
}
##############
termux_font_env() {
  FONTS_DIR=${HOME}/.config/fonts
  TERMUX_PATH="${HOME}/.termux"
  COUNT=1
  case $(uname -o) in
    Android) ;;
    *)
      get_font_help_info
      printf "%s\n" "The function of changing fonts is only suitable for termux."
      exit 1
      ;;
  esac
}
########
get_font_help_info() {
  CATCAT=''
  for i in $PREFIX/bin/lolcat; do
    [[ ! -f ${i} ]] || CATCAT="${i}"
  done
  unset i
  case ${CATCAT} in
    "") CATCAT='cat' ;;
  esac
  case ${CATCAT_COLOR} in
    false) CATCAT='cat' ;;
  esac
}
######
choose_termux_font() {
  printf "%s\n" "You can choose ${GREEN}any font ${RESET}from the ${BLUE}list below${RESET}."
  for TERMUX_FONT in ${FONTS_DIR}/*/{*.ttf,*.otf}; do
    TERMUX_FONT_FILE[COUNT]=${TERMUX_FONT}
    printf "%s\n" "[${COUNT}] $(echo ${TERMUX_FONT_FILE[COUNT]} | awk -F '/' '{print $NF}' | sed 's@ Nerd Font@@g;s@ Complete@@g;s@ Mono @ @;s@ .ttf@@g;s@ .otf@@g;s@.ttf@@g;s@.otf@@g')"
    COUNT=$((${COUNT} + 1))
  done
  COUNT=$((${COUNT} - 1))

  while true; do
    read -p "\
${BOLD}${YELLOW}Please${RESET} type the ${GREEN}option number${RESET} and press ${BLUE}Enter${RESET}${CYAN}${BOLD}[1-${COUNT}]${RESET}:" FONT_NUMBER
    if [[ -z "${FONT_NUMBER}" ]]; then
      break
    elif ! [[ ${FONT_NUMBER} =~ ^[0-9]+$ ]]; then
      printf "%s\n" "${BOLD}${YELLOW}Please ${RESET}type the ${BOLD}${RED}right number!${RESET}"
    elif ((${FONT_NUMBER} >= 1 && ${FONT_NUMBER} <= ${COUNT})); then
      #eval CHOICE=${TERMUX_FONT_FILE[FONT_NUMBER]}
      #cp -pfvr "${CHOICE}" "${TERMUX_PATH}/font.ttf"
      cp -fr "${TERMUX_FONT_FILE[FONT_NUMBER]}" "${TERMUX_PATH}/font.ttf"
      break
    else
      printf "%s\n" "${BOLD}${YELLOW}Please ${RESET}type the ${BOLD}${RED}right number!${RESET}"
    fi
  done
  termux-reload-settings
}
##############
termux_font_main "$@"
