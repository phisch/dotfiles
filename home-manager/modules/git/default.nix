{ inputs, lib, config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Philipp Schaffrath";
    userEmail = "philipp.schaffrath@gmail.com";
    signing = {
      signByDefault = true;
      key = "E5D3C326D00A7C3D";
    };
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
      advice = {
        addIgnoredFiles = false;
      };
    };
  };
}
 