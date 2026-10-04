{
  username,
  firefox-addons,
  config,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles.${username} = {
      isDefault = true;
      extensions.packages = with firefox-addons.packages."x86_64-linux"; [
        i-dont-care-about-cookies
        ublock-origin
        pwnfox
        cookie-editor
        multi-account-containers
        container-proxy
      ];

      settings = {
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "browser.startup.page" = 1;
        "browser.startup.homepage" = "https://www.google.com/";
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
      search = {
        force = true;
        default = "google";
        engines = {
          "Brave" = {
            urls = [
              {
                template = "https://search.brave.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "https://brave.com/static-assets/images/brave-favicon.png";
            definedAliases = [ "@brave" ];
          };
        };
      };
      bookmarks = {
        force = true;
        settings = [
          {
            toolbar = true;
            bookmarks = [
              {
                name = "ECE";
                bookmarks = [
                  {
                    name = "Boostcamp";
                    url = "https://adfs.inseecgateway.com/adfs/ls/";
                  }
                  {
                    name = "HYPERPLANNING";
                    url = "https://planning-paris.omneseducation.com/etudiant?identifiant=atRfBMrm2HAsJPGd";
                  }
                  {
                    name = "GlobalExam";
                    url = "https://auth.global-exam.com/register";
                  }
                ];
              }
              {
                name = "IA";
                bookmarks = [
                  {
                    name = "Claude";
                    url = "https://claude.ai/new";
                  }
                  {
                    name = "ChatGPT";
                    url = "https://chatgpt.com/";
                  }
                  {
                    name = "DeepSeek";
                    url = "https://chat.deepseek.com/";
                  }
                ];
              }
              {
                name = "Cyber";
                bookmarks = [
                  {
                    name = "HackTricks";
                    url = "https://book.hacktricks.wiki/en/index.html";
                  }
                  {
                    name = "CyberChef";
                    url = "https://gchq.github.io/CyberChef/";
                  }
                  {
                    name = "Cyber Book";
                    url = "https://drive.google.com/drive/u/0/folders/1t_Mj_pZTWsbnNZPelsYP5iJQykPjD3Q7";
                  }
                  {
                    name = "Web Security Academy";
                    url = "https://portswigger.net/web-security";
                  }
                  {
                    name = "PayloadsAllTheThings";
                    url = "https://github.com/swisskyrepo/payloadsallthethings";
                  }
                  {
                    name = "SpecterOps";
                    url = "https://bloodhound.specterops.io/resources/edges/overview";
                  }
                  {
                    name = "hackndo";
                    url = "https://beta.hackndo.com/";
                  }
                  {
                    name = "HTB";
                    url = "https://academy.hackthebox.com/dashboard";
                  }
                ];
              }
              {
                name = "HomeLab";
                bookmarks = [
                  {
                    name = "FileBrowser";
                    url = "http://filebrowser.local:8080/login?redirect=/files/";
                  }
                  {
                    name = "Proxmox";
                    url = "https://server1.local:8006/";
                  }
                  {
                    name = "Grafana";
                    url = "http://grafana.local:3000/";
                  }
                  {
                    name = "OPNsense";
                    url = "https://opnsense.local/";
                  }
                ];
              }
              {
                name = "Administratif";
                bookmarks = [
                  {
                    name = "Mon espace santé";
                    url = "https://www.monespacesante.fr/mon-espace";
                  }
                  {
                    name = "CAF";
                    url = "https://caf.fr/";
                  }
                  {
                    name = "Ameli";
                    url = "https://assure.ameli.fr/PortailAS/appmanager/PortailAS/assure";
                  }
                  {
                    name = "Crédit Agricole";
                    url = "https://www.credit-agricole.fr/ca-centrest/particulier/operations/synthese.html";
                  }
                ];
              }
              {
                name = "Nix";
                bookmarks = [
                  {
                    name = "NixOS Packages";
                    url = "https://search.nixos.org/packages";
                  }
                  {
                    name = "Home Manager Options";
                    url = "https://home-manager-options.extranix.com/?release=master";
                  }
                ];
              }
              {
                name = "YouTube";
                url = "https://www.youtube.com/";
              }
              {
                name = "Twitch";
                url = "https://www.twitch.tv/";
              }
              {
                name = "WhatsApp";
                url = "https://web.whatsapp.com/";
              }
              {
                name = "Amazon Music";
                url = "https://music.amazon.fr/";
              }
              {
                name = "DeepL";
                url = "https://www.deepl.com/translator";
              }
              {
                name = "GitHub";
                url = "https://github.com/";
              }
              {
                name = "LinkedIn";
                url = "https://www.linkedin.com/feed/";
              }
              {
                name = "Canva";
                url = "https://www.canva.com/";
              }
              {
                name = "Google Docs";
                url = "https://docs.google.com/";
              }
              {
                name = "OneDrive";
                url = "https://onedrive.live.com/?id=root&cid=AEE9EC3CBB562C1C";
              }
              {
                name = "Chess.com";
                url = "https://www.chess.com/home";
              }
              {
                name = "Teams";
                url = "https://teams.live.com/v2";
              }
            ];
          }
        ];
      };
    };
  };
  stylix.targets.firefox.profileNames = [ username ];
}
