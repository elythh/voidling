{
  inputs,
  pkgs,
  ...
}:
{
    home.packages = [
      inputs.quickshell.packages."${pkgs.system}".quickshell
      pkgs.kdePackages.qt5compat
      pkgs.kdePackages.qtmultimedia

      inputs.caelestia-cli.packages."${pkgs.system}".default
      inputs.caelestia.packages."${pkgs.system}".default
    ];

    wayland.windowManager.hyprland = {
      settings = {
        bind = [
          # "SUPER, D, global, caelestia:launcher"
          "SUPER, C, global, caelestia:clearNotifs"
          "SUPER, L, global, caelestia:lock"

          "SUPERSHIFT, S, global, caelestia:screenshot"
        ];
      };
    };
}

