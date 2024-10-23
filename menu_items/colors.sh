#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"

source "$ROOT_DIR/scripts/utils.sh"

render() {
  local theme=$(get_tmux_option "@kanagawa-theme" "wave")

  local wave_title="Wave"
  local dragon_title="Dragon"
  local lotus_title="Lotus"

  case $theme in
  wave)
    wave_title="Wave*"
    ;;
  dragon)
    dragon_title="Dragon*"
    ;;
  lotus)
    lotus_title="Lotus*"
    ;;
  esac

  tmux display-menu -T "#[align=centre fg=green]Colors" -x R -y P \
    "" \
    "" \
    "$wave_title" 1 "run -b '#{KANAGAWA_ROOT}/scripts/actions.sh set_state_and_tmux_option theme wave" \
    "$dragon_title" 2 "run -b '#{KANAGAWA_ROOT}/scripts/actions.sh set_state_and_tmux_option theme dragon" \
    "$lotus_title" 3 "run -b '#{KANAGAWA_ROOT}/scripts/actions.sh set_state_and_tmux_option theme lotus" \
    "" \
    "<-- Back" b "run -b 'source #{KANAGAWA_ROOT}/menu_items/main.sh" \
    "Close menu" q ""
}

render
