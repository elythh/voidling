{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
  ];

  nixpkgs = {
    config.allowUnfreeSoftware = true;
    config.permittedInsecurePackages = [
      "qtwebengine-5.15.19"
    ];

    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];

    config = {
      allowUnfree = true;
      allowInsecure = true;
    };
  };

  home = {
    username = "gwen";
    homeDirectory = "/home/gwen";
  };

  home.packages = with pkgs; [
     networkmanager
     nerd-fonts.fira-code
     stremio
     tailscale
     vesktop
     nh
     lazygit
     bitwarden
     fzf
     direnv
     slacky


     inputs.neovim.packages."aarch64-linux".neovim
     inputs.chromium-widevine.packages.aarch64-linux.chromium-widevine
  ];

  home.file.".local/share/applications/chromium-browser.desktop" = {
    text = ''
      [Desktop Entry]
      Name=Chromium
      GenericName=browser
      Comment=Chromium browser with Widevine
      Exec=${inputs.chromium-widevine.packages.aarch64-linux.chromium-widevine}/bin/chromium
      Terminal=false
      Type=Application
      Keywords=browser;internet;
      Categories=Utility;
    '';
  };
  home.file.".local/share/applications/spotify.desktop" = {
    text = ''
      [Desktop Entry]
      Name=Spotify
      GenericName=music
      Comment=Listen to Spotify
      Exec=${inputs.chromium-widevine.packages.aarch64-linux.chromium-widevine}/bin/chromium --app=https://open.spotify.com
      Terminal=false
      Type=Application
      Keywords=music;
      Categories=Music;
    '';
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.zen-browser.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";
}
