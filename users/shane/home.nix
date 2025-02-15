{ pkgs, ... }:

{
  # import the core and specific configuration files for home setup
  imports = [
    ../../home/core.nix # core home configuration
    ../../home/i3 # i3 window manager configuration
    ../../home/programs # general programs configuration
    ../../home/shell # shell configuration
    ../../home/polybar # polybar configuration
    ../../home/rofi # rofi (application launcher) configuration
  ];

  catppuccin = {
    # enable catppuccin theme for home-manager
    enable = true;

    # set the flavor of the catppuccin theme (mocha in this case)
    flavor = "mocha";

    gtk = {
      flavor = "mocha";
      accent = "mauve";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };

  home = {
    # set cursor to mocha (light)
    pointerCursor = {
      x11.enable = true;
      gtk.enable = true;

      name = "catppuccin-mocha-light-cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
      size = 24;
    };

    # define packages to be installed for the user
    packages =
      with pkgs;
      with php83Packages;
      with nodePackages;
      [
        nixfmt-rfc-style # nixfmt tool for formatting nix files according to RFC style
        gcc # GNU Compiler Collection
        rustup # Rust toolchain installer
        signal-desktop # Signal desktop application (end-to-end encrypted messaging)
        vesktop # Discord client
        vlc # VLC media player
        runelite # RuneScape client (old-school)
        vscode # Visual Studio Code (code editor)
        kmymoney # KMyMoney (personal finance manager)
        nextcloud-client # Nextcloud client for syncing files and data
        laravel # laravel application installer
        composer # dependency manager for PHP
        nodejs # event-driven I/O framework for the V8 JavaScript engine
        pnpm # fast, disk space efficient package manager for JavaScript
        papirus-folders
      ];
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };

    cursorTheme = {
      name = "catppuccin-mocha-light-cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
      size = 24;
    };
  };

  programs.git = {
    # configure Git user details
    userName = "Shane Wilson"; # Git username
    userEmail = "shane.wilson@myyahoo.com"; # Git user email
  };
}
