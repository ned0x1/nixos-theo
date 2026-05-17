{
  config,
  pkgs,
  username,
  ...
}:

{
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "wireshark"
    ];
  };
}
