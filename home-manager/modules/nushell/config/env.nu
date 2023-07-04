#!/usr/bin/env nu

let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]


let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

let-env _JAVA_AWT_WM_NONREPARENTING = 1
let-env _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=gasp"

let-env MOZ_ENABLE_WAYLAND = 1

let-env XDG_CURRENT_DESKTOP = "sway"
let-env XDG_SESSION_TYPE = "wayland"

let-env QT_QPA_PLATFORM = "wayland"
let-env QT_WAYLAND_DISABLE_WINDOWDECORATION = 1

let-env BEMENU_BACKEND = "wayland"
let-env WLR_DRM_NO_MODIFIERS = 1