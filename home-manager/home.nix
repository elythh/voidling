{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
  ];

  nixpkgs = {
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
     slack

     inputs.neovim.packages."aarch64-linux".neovim
  ];

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.zen-browser.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";
}
