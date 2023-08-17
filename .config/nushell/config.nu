#!/usr/bin/env nu

let theme = {
    separator: "#222222"
    header: green_bold
}

$env.config = {
  show_banner: false
  rm: {
    always_trash: true
  }
  cd: {
    abbreviations: true
  }
  table: {
    mode: compact
    index_mode: auto
  }
  history: {
    max_size: 10000
    file_format: "sqlite"
  }
  completions: {
    external: {
      enable: true
      completer: { |spans| 
        carapace $spans.0 nushell $spans | from json
      }
    }
  }
  cursor_shape: {
    emacs: underscore
  }
  color_config: $theme
  footer_mode: "auto"
  shell_integration: true
  hooks: {
    pre_prompt: [{ ||
      let direnv = (direnv export json | from json)
      let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
      $direnv | load-env
    }]
  }
  menus: []
  keybindings: [
    {
      name: delete_word
      modifier: control
      keycode: char_h # TODO: ctrl+backspace triggers `h`, this is a crossterm bug: https://github.com/crossterm-rs/crossterm/issues/685
      mode: emacs
      event: {
        until: [
          { edit: BackspaceWord }
        ]
      }
    }
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: emacs
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
  ]
}

use ~/.cache/starship/init.nu