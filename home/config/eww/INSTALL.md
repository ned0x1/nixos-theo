#!/usr/bin/env bash
# Quick start guide - Print human-readable summary

cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║      🎯 Eww Updates Menu - Configuration Complète             ║
╚════════════════════════════════════════════════════════════════╝

📋 CE QUI A ÉTÉ CHANGÉ
═══════════════════════════════════════════════════════════════

✏️  MODIFIÉ:
  • home/config/eww/updates.yuck
    → Ajout positionnement dynamique
    → Chemins absolus pour les scripts
    → Classes CSS pour styling
    
  • home/config/waybar/scripts/toggle_eww_updates.sh
    → Passage des arguments x, y à eww
    → Meilleure gestion du daemon

🆕 CRÉÉ:
  • home/config/eww/eww.scss
    → Styling du menu (Catppuccin theme)
    
  • home/config/waybar/scripts/run_update.sh
    → Script wrapper pour exécution
    
  • home/config/eww/README.md
    → Documentation complète
    
  • home/config/waybar/scripts/diagnose_eww.sh
    → Script diagnostic automatisé
    
  • home/config/waybar/scripts/troubleshoot_eww.sh
    → Guide interactif de dépannage
    
  • home/config/waybar/scripts/setup_eww.sh
    → Configuration automatisée

═══════════════════════════════════════════════════════════════

🚀 ÉTAPES À SUIVRE
═══════════════════════════════════════════════════════════════

1️⃣  DONNER LES PERMISSIONS AUX SCRIPTS:
   
   chmod +x ~/.config/waybar/scripts/toggle_eww_updates.sh
   chmod +x ~/.config/waybar/scripts/run_update.sh
   chmod +x ~/.config/waybar/scripts/run_system_update.sh
   chmod +x ~/.config/waybar/scripts/run_home_update.sh

   OU automatiquement:
   
   bash ~/.config/waybar/scripts/setup_eww.sh

2️⃣  RECHARGER WAYBAR (optionnel mais recommandé):
   
   killall waybar && waybar &
   
   OU
   
   systemctl --user restart waybar

3️⃣  TESTER LE MENU:
   
   • Cliquez sur l'icône "📦" dans waybar
   • Le menu doit apparître au-dessus
   • Cliquez sur "Système" ou "Home"
   • Un terminal kitty doit s'ouvrir

═══════════════════════════════════════════════════════════════

🔧 DIAGNOSTIC & DÉPANNAGE
═══════════════════════════════════════════════════════════════

Si ça ne fonctionne pas, lancez:

  bash ~/.config/waybar/scripts/diagnose_eww.sh

Cela va:
  ✓ Vérifier l'installation d'eww
  ✓ Vérifier les fichiers de config
  ✓ Tester le daemon
  ✓ Tester l'ouverture du menu

Pour un dépannage interactif:

  bash ~/.config/waybar/scripts/troubleshoot_eww.sh

═══════════════════════════════════════════════════════════════

📖 DOCUMENTATION
═══════════════════════════════════════════════════════════════

Pour plus de détails, voir:
  • home/config/eww/README.md
  • CHANGES_SUMMARY.md (dans nixos-theo/)

═══════════════════════════════════════════════════════════════

❓ PROBLÈMES COURANTS
═══════════════════════════════════════════════════════════════

Q: Le menu n'apparaît pas
A: Vérifiez avec 'diagnose_eww.sh' et consultez 'eww logs --follow'

Q: Le menu apparaît au mauvais endroit
A: Modifiez :x et :y dans home/config/eww/updates.yuck

Q: Les scripts ne s'exécutent pas
A: Vérifiez les permissions avec 'chmod +x'

Q: Eww n'est pas installé
A: C'est déjà dans home/user/packages.nix, rebuild avec:
   nixos-rebuild switch --flake .#<votre-config>

═══════════════════════════════════════════════════════════════

✨ C'est tout! Le menu devrait maintenant fonctionner. ✨

═══════════════════════════════════════════════════════════════

EOF
