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

let-env GPG_TTY = (tty)
let-env SSH_AUTH_SOCK = (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent


let-env _JAVA_AWT_WM_NONREPARENTING = 1
let-env _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=gasp"

#export EDITOR="nano"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
let-env PATH = ($env.PATH | split row (char esep) | prepend '~/.cargo/bin')

let-env MOZ_ENABLE_WAYLAND = 1
#path+=(~/.cargo/bin)

#export npm_config_prefix="$HOME/.local"
#path+=($HOME/.local/bin)

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu