#!/data/data/com.termux/files/usr/bin/env bash
################
termux_color_main() {
  terminal_color
  termux_color_env
  CATCAT_COLOR=true
  choose_termux_color
  case_termux_zsh_color_scheme
}
###############
terminal_color() {
  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  PURPLE=$(printf '\033[35m')
  CYAN=$(printf '\033[36m')
  BOLD=$(printf '\033[1m')
  RESET=$(printf '\033[m')
}
###############
case_termux_zsh_color_scheme() {
  case ${TERMUX_COLOR} in
  "") ;;
  *)
    TERMUX_ZSH_COLOR="${TERMUX_COLOR}"
    cp -rf "${COLORS_DIR}/${TERMUX_ZSH_COLOR}" "${TERMUX_COLOR_FILE}"
    termux-reload-settings
    ;;
  esac
}
############
termux_color_env() {
  TERMUX_COLOR=''
  case $(uname -o) in
  Android) [[ -e "${HOME}/.termux" ]] || mkdir -pv ${HOME}/.termux ;;
  *)
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
  PS3="${YELLOW}Please${RESET} type the ${GREEN}option number${RESET} and press ${BLUE}Enter${RESET}${CYAN}${BOLD}[1-88]${RESET}:"
  select TERMUX_COLOR_NAME in '3024.dark' 'aci' 'aco' 'apathy.dark' 'argonaut' 'ashes.dark' 'atelierdune.dark' 'atelierforest.dark' 'atelierheath.dark' 'atelierlakeside.dark' 'atelierseaside.dark' 'azu' 'base16.solarized.dark' 'bespin.dark' 'bim' 'black.on.white' 'brewer.dark' 'bright.dark' 'cai' 'chalk' 'chalk.dark' 'codeschool.dark' 'colors.dark' 'default' 'default.dark' 'dracula' 'eighties.dark' 'elementary' 'elic' 'elio' 'embers.dark' 'flat' 'flat.dark' 'freya' 'gnometerm' 'google.dark' 'gotham' 'grayscale.dark' 'greenscreen.dark' 'gruvbox.dark' 'gruvbox_hard' 'harmonic16.dark' 'hemisu.dark' 'hybrid' 'iceberg.dark' 'isotope.dark' 'jup' 'londontube.dark' 'mar' 'marrakesh.dark' 'materia' 'material' 'miu' 'mocha.dark' 'monokai.dark' 'nancy' 'neon' 'nep' 'nord' 'ocean.dark' 'one.dark' 'pali' 'paraiso.dark' 'peppermint' 'railscasts.dark' 'rydgel' 'sat' 'shapeshifter.dark' 'shel' 'smyck' 'solarized.dark' 'summerfruit.dark' 'tango' 'terminal' 'tin' 'tomorrow' 'tomorrow.dark' 'tomorrow.night' 'tomorrow.night.blue' 'tomorrow.night.bright' 'tomorrow.night.eighties' 'twilight.dark' 'ura' 'vag' 'white.on.black' 'wild.cherry' 'zenburn' 'skip'; do
    case ${TERMUX_COLOR_NAME} in
    'skip')
      cat <<-ENDOFZSHHELP
skipped!
ENDOFZSHHELP
      break
      ;;
    '3024.dark' | 'aci' | 'aco' | 'apathy.dark' | 'argonaut' | 'ashes.dark' | 'atelierdune.dark' | 'atelierforest.dark' | 'atelierheath.dark' | 'atelierlakeside.dark' | 'atelierseaside.dark' | 'azu' | 'base16.solarized.dark' | 'bespin.dark' | 'bim' | 'black.on.white' | 'brewer.dark' | 'bright.dark' | 'cai' | 'chalk' | 'chalk.dark' | 'codeschool.dark' | 'colors.dark' | 'default' | 'default.dark' | 'dracula' | 'eighties.dark' | 'elementary' | 'elic' | 'elio' | 'embers.dark' | 'flat' | 'flat.dark' | 'freya' | 'gnometerm' | 'google.dark' | 'gotham' | 'grayscale.dark' | 'greenscreen.dark' | 'gruvbox.dark' | 'gruvbox_hard' | 'harmonic16.dark' | 'hemisu.dark' | 'hybrid' | 'iceberg.dark' | 'isotope.dark' | 'jup' | 'londontube.dark' | 'mar' | 'marrakesh.dark' | 'materia' | 'material' | 'miu' | 'mocha.dark' | 'monokai.dark' | 'nancy' | 'neon' | 'nep' | 'nord' | 'ocean.dark' | 'one.dark' | 'pali' | 'paraiso.dark' | 'peppermint' | 'railscasts.dark' | 'rydgel' | 'sat' | 'shapeshifter.dark' | 'shel' | 'smyck' | 'solarized.dark' | 'summerfruit.dark' | 'tango' | 'terminal' | 'tin' | 'tomorrow' | 'tomorrow.dark' | 'tomorrow.night' | 'tomorrow.night.blue' | 'tomorrow.night.bright' | 'tomorrow.night.eighties' | 'twilight.dark' | 'ura' | 'vag' | 'white.on.black' | 'wild.cherry' | 'zenburn')
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
  printf "%s\n" "The ${YELLOW}default color scheme${RESET} depends on ${PURPLE}your phone${RESET}."
  printf "%s\n" "You can choose ${GREEN}another one${RESET} from the ${BLUE}list below${RESET}."
  select_termux_color
  termux-reload-settings
}
############
termux_color_main "$@"
