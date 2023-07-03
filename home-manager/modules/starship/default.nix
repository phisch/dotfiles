{ inputs, lib, config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
      format = "$all";
      directory = {
        style = "yellow bold";
      };
      line_break = {
        disabled = true;
      };
      character = {
        success_symbol = "[❯](bold white)";
      };
      git_branch = {
        style = "bold #555555";
      };
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bold #555555";
        modified = "󰈅";
        deleted = "󰅖";
      };
    };
  };
}
