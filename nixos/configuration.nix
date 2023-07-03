{ inputs, lib, config, pkgs, ... }: {
  imports = [
    hardware/tower.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  xdg.portal.xdgOpenUsePortal = true;

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  networking = {
    hostName = "tower";
    networkmanager = {
      enable = true;
      dhcp = "dhcpcd";
      wifi =  {
        backend = "iwd";
      };
    };
    wireless = {
      iwd = {
        enable = true;
      };
    };
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  programs.dconf.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  console.keyMap = "de-latin1-nodeadkeys";

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users = {
    phisch = {
      initialPassword = "phisch";
      isNormalUser = true;
      description = "Philipp Schaffrath";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.nushell;
    };
  };

  security = {
    polkit = {
      enable = true;
    };
    pam = {
      services = {
        root = {
          u2fAuth = true;
        };
        login = {
          u2fAuth = true;
        };
        polkit-1 = {
          u2fAuth = true;
        };
      };

      u2f = {
        enable = true;
        cue = true;
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      home-manager
    ];
  };

  fonts.fonts = with pkgs; [
    jetbrains-mono
    material-design-icons
  ];

  #services.xserver.enable = true;

  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  #services.xserver = {
  #  layout = "de";
  #  xkbVariant = "nodeadkeys";
  #};

  services.getty.autologinUser = "phisch";

  #services.xserver.displayManager.autoLogin.enable = true;
  #services.xserver.displayManager.autoLogin.user = "phisch";

  #systemd.services."getty@tty1".enable = false;
  #systemd.services."autovt@tty1".enable = false;

  system.stateVersion = "23.05";
}
