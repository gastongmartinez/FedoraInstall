#!/usr/bin/env bash

R_USER=$(id -u)
if [ "$R_USER" -eq 0 ];
then
   echo "Este script debe usarse con un usuario regular."
   echo "Saliendo..."
   exit 1
fi

if [ -z "$DISPLAY" ];
then
    echo -e "Debe ejecutarse dentro del entorno grafico.\n"
    echo "Saliendo..."
    exit 2
fi

############################################## Extensiones ##################################################################################
# User themes
dconf write /org/gnome/shell/enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.  github.com','user-theme@gnome-shell-extensions.gcampax.github.com']"

# ArcMenu
dconf write /org/gnome/shell/enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.  github.com','user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com']"
dconf write /org/gnome/shell/extensions/arcmenu/available-placement "[true, false, false]"
dconf write /org/gnome/mutter/overlay-key "'Super_L'"
dconf write /org/gnome/desktop/wm/keybindings/panel-main-menu "['<Alt>F1']"
dconf write /org/gnome/shell/extensions/arcmenu/pinned-app-list "['Web', '', 'org.gnome.Epiphany.desktop', 'Terminal', '', 'orggnome.Terminal. desktop', 'ArcMenu Settings', 'ArcMenu_ArcMenuIcon', 'gnome-extensions prefs arcmenu@arcmenu.com']"
dconf write /org/gnome/shell/extensions/arcmenu/menu-hotkey "'Super_L'"

# Dash to Dock
dconf write /org/gnome/shell/enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.  github.com','user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'dash-to-dock@micxgx.gmail.com']"
dconf write /org/gnome/shell/extensions/arcmenu/available-placement "[false, false, true]"
dconf write /org/gnome/shell/extensions/dash-to-dock/preferred-monitor 0
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/autohide true
dconf write /org/gnome/shell/extensions/dash-to-dock/show-trash false
dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button false
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'DYNAMIC'"
dconf write /org/gnome/shell/extensions/dash-to-dock/customize-alphas true
dconf write /org/gnome/shell/extensions/dash-to-dock/min-alpha 0.10
dconf write /org/gnome/shell/extensions/dash-to-dock/max-alpha 0.60
dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button true
dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top true
dconf write /org/gnome/shell/extensions/dash-to-dock/animate-show-apps true

# Drop down Terminal
dconf write /org/gnome/shell/enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.  github.com','user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'dash-to-dock@micxgx.gmail.com','drop-down-terminal-x@bigbn.pro']"
dconf write /pro/bigbn/drop-down-terminal-x/other-shortcut "['F12']"
dconf write /pro/bigbn/drop-down-terminal-x/enable-tabs true
dconf write /pro/bigbn/drop-down-terminal-x/use-default-colors true
#############################################################################################################################################
# Teclado
#dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'es+winkeys')]"

# Ventanas
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,maximize,close'"
dconf write /org/gnome/mutter/center-new-windows true

# Tema
dconf write /org/gnome/desktop/interface/gtk-theme "'Prof-Gnome-Dark-3.6'"
dconf write /org/gnome/shell/extensions/user-theme/name "'Prof-Gnome-Dark-3.6'"
dconf write /org/gnome/desktop/interface/cursor-theme "'Qogir-manjaro-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Qogir-manjaro-dark'"

# Wallpaper
dconf write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/wallpapers/Space/space%2018.jpg'"

# Establecer fuentes
dconf write /org/gnome/desktop/interface/font-name "'Noto Sans CJK HK 11'"
dconf write /org/gnome/desktop/interface/document-font-name "'Noto Sans CJK HK 11'"
dconf write /org/gnome/desktop/interface/monospace-font-name "'Monospace 10'"
dconf write /org/gnome/desktop/wm/preferences/titlebar-font "'Noto Sans CJK HK Bold 11'"

# Aplicaciones favoritas
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Evolution.desktop', 'libreoffice-calc.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'brave-browser.desktop', 'org.qbittorrent.qBittorrent.desktop', 'code.desktop', 'codeblocks.desktop', 'Alacritty.desktop', 'clementine.desktop', 'vlc.desktop', 'org.gnome.tweaks.desktop']"

# Suspender
# En 2 horas enchufado
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout 7200
# En 30 minutos con bateria
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-timeout 1800
#############################################################################################################################################


# Autostart Apps
#if [ ! -d ~/.config/autostart ]; then
#    mkdir -p ~/.config/autostart
#fi
#cp /usr/share/applications/plank.desktop ~/.config/autostart/    

# Doom Emacs
if [ -d ~/.emacs.d ]; then
    rm -Rf ~/.emacs.d
fi
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# ZSH
if [ ! -d ~/.local/share/zsh ]; then
    mkdir ~/.local/share/zsh
fi
touch ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/zsh/powerlevel10k
{
    echo 'source ~/.local/share/zsh/powerlevel10k/powerlevel10k.zsh-theme'
    echo 'source /usr/share/autojump/autojump.zsh'
    echo 'source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
    echo 'source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' 
} >>~/.zshrc
chsh -s /usr/bin/zsh