# 📋 Documentation - Eww Updates Menu

## Vue d'ensemble

Le système de menu des mises à jour utilise **Eww** (ElKowar's Wacky Widgets) pour créer une petite fenêtre déroulante sous le bouton de waybar. Quand vous cliquez sur le logo de mises à jour, une fenêtre apparaît avec deux options :

- **Système** : Lance `sudo nixos-rebuild switch`
- **Home** : Lance `home-manager switch`

## Architecture

```
waybar (custom/updates module)
   ↓ (on-click)
toggle_eww_updates.sh
   ↓
eww daemon (gère la fenêtre)
   ↓ (button clicks)
run_update.sh (system|home)
   ↓
run_system_update.sh ou run_home_update.sh
   ↓
Terminal kitty (affiche les logs)
```

## Fichiers modifiés

### 1. **home/config/eww/updates.yuck**
- Définit la fenêtre Eww avec deux boutons
- Positionnée au centre-haut par défaut (50%, 30px)
- Les onclick exécutent les scripts correspondants
- Arguments `x` et `y` permettent un positionnement dynamique

### 2. **home/config/eww/eww.scss**
- Style CSS pour les boutons et la fenêtre
- Thème Catppuccin Macchiato
- Effets hover/active pour meilleure UX

### 3. **home/config/waybar/scripts/toggle_eww_updates.sh**
- Lance le daemon eww si nécessaire
- Bascule la fenêtre (ouvre/ferme)
- Passe les coordonnées à eww pour le positionnement

### 4. **home/config/waybar/scripts/run_update.sh** (NOUVEAU)
- Script wrapper qui :
  - Ferme la fenêtre eww
  - Route vers run_system_update.sh ou run_home_update.sh
  - Gère les erreurs proprement

## Dépannage

### Le menu ne s'ouvre pas au clic

1. Vérifiez que eww est installé :
   ```bash
   which eww
   eww --version
   ```

2. Vérifiez que les fichiers de config sont présents :
   ```bash
   ls -la ~/.config/eww/
   ```

3. Vérifiez les logs eww :
   ```bash
   eww logs --follow
   ```

4. Testez manuellement :
   ```bash
   eww daemon
   eww open updates
   ```

### Les scripts ne s'exécutent pas

1. Vérifiez les permissions :
   ```bash
   chmod +x ~/.config/waybar/scripts/run_*.sh
   chmod +x ~/.config/waybar/scripts/toggle_eww_updates.sh
   ```

2. Testez les scripts directement :
   ```bash
   bash ~/.config/waybar/scripts/run_update.sh system
   ```

3. Vérifiez les chemins nixos-theo :
   ```bash
   ls -la ~/Documents/nixos-theo/
   ```

### La position est mauvaise

Si le menu n'apparaît pas au bon endroit, modifiez dans `updates.yuck` :

```yuck
:anchor "top center"    ;; Point d'ancrage (top/center/bottom left/center/right)
:x "50%"                ;; Position X (px ou %)
:y "30px"               ;; Position Y (px ou %)
```

### Terminal ne s'ouvre pas

Les scripts `run_system_update.sh` et `run_home_update.sh` ouvrent un terminal kitty. Vérifiez :

```bash
which kitty
kitty --version
```

## Exécution de diagnostic

Lancez le script de diagnostic :
```bash
bash ~/.config/waybar/scripts/diagnose_eww.sh
```

## Amélioration future

- Positionnement dynamique basé sur la vraie position du curseur/widget waybar
- Menu animé
- Support de plusieurs écrans
- Notifications de progression
