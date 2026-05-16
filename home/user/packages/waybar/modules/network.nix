{
  network = {
    format-wifi = "{essid}  ";
    format-ethernet = "{ipaddr}/{cidr} 󰈀";
    tooltip-format = "{ifname}: via {gwaddr} \n<small>down/up:  {bandwidthDownBytes}   {bandwidthUpBytes}</small>";
    format-linked = "{ifname} (No IP) ";
    format-disconnected = "󰌙";
    format-alt = "{ifname}: {ipaddr}/{cidr}";
    interval = 1;
    on-click-right = "kitty -e nmtui";
    max-length = 30;
  };
} 
