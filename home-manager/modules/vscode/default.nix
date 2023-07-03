{ pkgs, ... }: rec {
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.rust-lang.rust-analyzer
      vscode-extensions.serayuzgur.crates
      vscode-extensions.github.copilot
      vscode-extensions.vadimcn.vscode-lldb
      vscode-extensions.usernamehw.errorlens
      vscode-extensions.tamasfe.even-better-toml
      vscode-extensions.redhat.vscode-yaml
    ];

    userSettings = {
      editor = {
        fontFamily = "Material Design Icons, JetBrains Mono, monospace";
        fontSize = 16;
        hover.enabled = false;
        inlineSuggest.enabled = true;
        minimap.enabled = false;
      };
      telemetry.telemetryLevel = "off";
      window.menuBarVisibility = "toggle";
    };
  };

  home.activation.boforeCheckLinkTargets = {
    after = [];
    before = [ "checkLinkTargets" ];
    data = "rm -rf ~/.config/Code/User/settings.json";
  };

  home.activation.afterWriteBoundary = {
    after = [ "writeBoundary" ];
    before = [];
    data = ''cat ${(pkgs.formats.json {}).generate "" programs.vscode.userSettings} > ~/.config/Code/User/settings.json'';
  };
}
