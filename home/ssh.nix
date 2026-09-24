{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."homelab" = {
      HostName = "filebrowser.local";
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519_samba";
      IdentitiesOnly = "yes";
    };
  };
}
