{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.programmes.obsidian;
in
{
  programmes.obsidian = {
    enable = mkEnableOption "obsidian";

    repoUrl = mkOption {
      type = types.str;
      default = "https://github.com/theophiledutrey/obsidian-repo";
    };

    vaultPath = mkOption {
      type = types.str;
      default = "$HOME/obsidian-repo";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.obsidian ];

    home.activation.cloneObsidianRepo = hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "${cfg.vaultPath}" ]; then
        ${pkgs.git}/bin/git clone ${cfg.repoUrl} ${cfg.vaultPath}
      fi
    '';
  };
}
