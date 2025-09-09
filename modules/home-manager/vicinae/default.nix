{
  inputs,
  ...
}:
{
  imports = [ inputs.vicinae.homeManagerModules.default ];
  config = {
    services.vicinae = {
      enable = true;
    };
  };
}
