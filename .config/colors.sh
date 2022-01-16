#!/data/data/com.termux/files/usr/bin/env bash
################
tmoe_color_main() {
  terminal_color
  tmoe_termux_color_env
  CATCAT_COLOR=true
  choose_termux_color
  case_tmoe_zsh_color_scheme
}
###############
terminal_color() {
  PURPLE=$(printf '\033[0;35m')
  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  BOLD=$(printf '\033[1m')
  RESET=$(printf '\033[m')
}
###############
case_tmoe_zsh_color_scheme() {
  case ${TMOE_COLOR} in
  "") ;;
  *)
    TMOE_TERMUX_COLOR="${TMOE_COLOR}"
    cp -rf "${COLORS_DIR}/${TMOE_TERMUX_COLOR}" "${TERMUX_COLOR_FILE}"
    termux-reload-settings
    ;;
  esac
}
############
tmoe_termux_color_env() {
  TMOE_COLOR=''
  case $(uname -o) in
  Android) [[ -e "${HOME}/.termux" ]] || mkdir -pv ${HOME}/.termux ;;
  *)
    get_tmoe_termux_color_help_info
    printf "%s\n" "${RED}Sorry${RESET}！GNU/Linux"
    printf "%s\n" "zsh-i。"
    printf "%s\n" "The function of changing color scheme is only suitable for termux."
    exit 1
    ;;
  esac
  TERMUX_COLOR_FILE="${HOME}/.termux/colors.properties"
  COLORS_DIR="${HOME}/.config/colors"
}
############
select_termux_color() {
  #cat <<-ENDOFTMOEZSHHELP03
  #ENDOFTMOEZSHHELP03
  PS3="Please type the ${GREEN}number${RESET} and press ${BLUE}Enter${RESET}${YELLOW}[1-125]:${RESET}"
  select TERMUX_COLOR_NAME in '3024.dark' '3024.light' 'aci' 'aco' 'apathy.dark' 'apathy.light' 'argonaut' 'ashes.dark' 'ashes.light' 'atelierdune.dark' 'atelierdune.light' 'atelierforest.dark' 'atelierforest.light' 'atelierheath.dark' 'atelierheath.light' 'atelierlakeside.dark' 'atelierlakeside.light' 'atelierseaside.dark' 'atelierseaside.light' 'azu' 'base16.solarized.dark' 'base16.solarized.light' 'bespin.dark' 'bespin.light' 'bim' 'black.on.white' 'brewer.dark' 'brewer.light' 'bright.dark' 'bright.light' 'cai' 'chalk' 'chalk.dark' 'chalk.light' 'codeschool.dark' 'codeschool.light' 'colors.dark' 'colors.light' 'default' 'default.dark' 'default.light' 'dracula' 'eighties.dark' 'eighties.light' 'elementary' 'elic' 'elio' 'embers.dark' 'embers.light' 'flat' 'flat.dark' 'flat.light' 'freya' 'gnometerm' 'google.dark' 'google.light' 'gotham' 'grayscale.dark' 'grayscale.light' 'greenscreen.dark' 'greenscreen.light' 'gruvbox.dark' 'gruvbox.light' 'harmonic16.dark' 'harmonic16.light' 'hemisu.dark' 'hemisu.light' 'hybrid' 'iceberg.dark' 'isotope.dark' 'isotope.light' 'jup' 'londontube.dark' 'londontube.light' 'mar' 'marrakesh.dark' 'marrakesh.light' 'materia' 'material' 'miu' 'mocha.dark' 'mocha.light' 'monokai.dark' 'monokai.light' 'nancy' 'neon' 'nep' 'nord' 'ocean.dark' 'ocean.light' 'one.dark' 'one.light' 'pali' 'paraiso.dark' 'paraiso.light' 'peppermint' 'railscasts.dark' 'railscasts.light' 'rydgel' 'sat' 'shapeshifter.dark' 'shapeshifter.light' 'shel' 'smyck' 'solarized.dark' 'solarized.light' 'summerfruit.dark' 'summerfruit.light' 'tango' 'tin' 'tomorrow' 'tomorrow.dark' 'tomorrow.light' 'tomorrow.night' 'tomorrow.night.blue' 'tomorrow.night.bright' 'tomorrow.night.eighties' 'twilight.dark' 'twilight.light' 'ura' 'vag' 'white.on.black' 'wild.cherry' 'zenburn' 'skip'; do
    case ${TERMUX_COLOR_NAME} in
    'skip')
      cat <<-ENDOFTMOEZSHHELP04
skipped!
ENDOFTMOEZSHHELP04
      break
      ;;
    '3024.dark' | '3024.light' | 'aci' | 'aco' | 'apathy.dark' | 'apathy.light' | 'argonaut' | 'ashes.dark' | 'ashes.light' | 'atelierdune.dark' | 'atelierdune.light' | 'atelierforest.dark' | 'atelierforest.light' | 'atelierheath.dark' | 'atelierheath.light' | 'atelierlakeside.dark' | 'atelierlakeside.light' | 'atelierseaside.dark' | 'atelierseaside.light' | 'azu' | 'base16.solarized.dark' | 'base16.solarized.light' | 'bespin.dark' | 'bespin.light' | 'bim' | 'black.on.white' | 'brewer.dark' | 'brewer.light' | 'bright.dark' | 'bright.light' | 'cai' | 'chalk' | 'chalk.dark' | 'chalk.light' | 'codeschool.dark' | 'codeschool.light' | 'colors.dark' | 'colors.light' | 'default' | 'default.dark' | 'default.light' | 'dracula' | 'eighties.dark' | 'eighties.light' | 'elementary' | 'elic' | 'elio' | 'embers.dark' | 'embers.light' | 'flat' | 'flat.dark' | 'flat.light' | 'freya' | 'gnometerm' | 'google.dark' | 'google.light' | 'gotham' | 'grayscale.dark' | 'grayscale.light' | 'greenscreen.dark' | 'greenscreen.light' | 'gruvbox.dark' | 'gruvbox.light' | 'harmonic16.dark' | 'harmonic16.light' | 'hemisu.dark' | 'hemisu.light' | 'hybrid' | 'iceberg.dark' | 'isotope.dark' | 'isotope.light' | 'jup' | 'londontube.dark' | 'londontube.light' | 'mar' | 'marrakesh.dark' | 'marrakesh.light' | 'materia' | 'material' | 'miu' | 'mocha.dark' | 'mocha.light' | 'monokai.dark' | 'monokai.light' | 'nancy' | 'neon' | 'nep' | 'nord' | 'ocean.dark' | 'ocean.light' | 'one.dark' | 'one.light' | 'pali' | 'paraiso.dark' | 'paraiso.light' | 'peppermint' | 'railscasts.dark' | 'railscasts.light' | 'rydgel' | 'sat' | 'shapeshifter.dark' | 'shapeshifter.light' | 'shel' | 'smyck' | 'solarized.dark' | 'solarized.light' | 'summerfruit.dark' | 'summerfruit.light' | 'tango' | 'tin' | 'tomorrow' | 'tomorrow.dark' | 'tomorrow.light' | 'tomorrow.night' | 'tomorrow.night.blue' | 'tomorrow.night.bright' | 'tomorrow.night.eighties' | 'twilight.dark' | 'twilight.light' | 'ura' | 'vag' | 'white.on.black' | 'wild.cherry' | 'zenburn')
      printf "%s\n" "${BLUE}${TERMUX_COLOR_NAME}${RESET}"
      cp -rf "${COLORS_DIR}/${TERMUX_COLOR_NAME}" "${TERMUX_COLOR_FILE}"
      break
      ;;
    *)
      printf '%s\n' "${BOLD}--------------${RESET}"
      printf "%s\n" "Please ${BLUE}type${RESET} the right ${BOLD}${RED}number${RESET}${RESET}!"
      ;;
    esac
  done
}
############
choose_termux_color() {
  printf "%s\n" "The ${YELLOW}default color scheme${RESET} is ${PURPLE}monokai dark${RESET}."
  printf "%s\n" "You can choose ${GREEN}another one${RESET} from the ${BLUE}list below${RESET}."
  select_termux_color
  termux-reload-settings
}
############
tmoe_color_main "$@"
