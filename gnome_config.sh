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

############################################# Tema WhiteSur #################################################################################
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme || return
./install.sh -c dark -i fedora -N glassy
./tweaks.sh -f
sudo ./tweaks.sh -g -b "/usr/share/backgrounds/wallpapers/Landscapes/landscapes 01.jpg"
cd ..

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme || return
./install.sh -t grey
cd ..

git clone https://github.com/vinceliuice/WhiteSur-cursors.git
cd WhiteSur-cursors || return
./install.sh
cd ..

rm -rf WhiteSur-gtk-theme
rm -rf WhiteSur-icon-theme
rm -rf WhiteSur-cursors
#############################################################################################################################################

############################################## Extensiones ##################################################################################
# User themes
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com']"

# ArcMenu
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com']"
dconf write /org/gnome/shell/extensions/arcmenu/available-placement "[true, false, false]"
dconf write /org/gnome/mutter/overlay-key "'Super_R'"
dconf write /org/gnome/shell/extensions/arcmenu/pinned-app-list "['Web', '', 'org.gnome.Epiphany.desktop', 'Terminal', '', 'orggnome.Terminal. desktop', 'ArcMenu Settings', 'ArcMenu_ArcMenuIcon', 'gnome-extensions prefs arcmenu@arcmenu.com']"
dconf write /org/gnome/shell/extensions/arcmenu/menu-hotkey "'Undefined'"
dconf write /org/gnome/desktop/wm/keybindings/panel-main-menu "['Super_L']"

# Extensions Sync
# dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'extensions-sync@elhan.io']"

# Quake-mode
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'extensions-sync@elhan.io', 'quake-mode@repsac-by.github.com']"
dconf write /com/github/repsac-by/quake-mode/quake-mode-app "'Alacritty.desktop'"
dconf write /com/github/repsac-by/quake-mode/quake-mode-hotkey "['F11']"

# Transparent Shell
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'extensions-sync@elhan.io', 'quake-mode@repsac-by.github.com', 'transparent-shell@siroj42.github.io']"

# Logo
dconf write /org/fedorahosted/background-logo-extension/logo-always-visible true

# Floating Dock
RES=$(xdpyinfo | awk '/dimensions/ {print $2}')
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'transparent-shell@siroj42.github.io', 'floatingDock@sun.wxg@gmail.com']"
if [ "$RES" == "1920x1080" ]; 
then
    dconf write /org/gnome/shell/extensions/floatingDock/floating-dock-position "[5, 1010]"
else
    dconf write /org/gnome/shell/extensions/floatingDock/floating-dock-position "[5, 700]"
fi
dconf write /org/gnome/shell/extensions/floatingDock/floating-dock-icon-size 32
dconf write /org/gnome/shell/extensions/floatingDock/floating-dock-direction "'right'"
dconf write /org/gnome/shell/extensions/floatingDock/floating-dock-icon-file "'/usr/share/icons/Bluecurve/32x32/apps/gnome-main-menu.png'"

# Removable Drive
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'transparent-shell@siroj42.github.io', 'floatingDock@sun.wxg@gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com']"

# Sensory Perception
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'transparent-shell@siroj42.github.io', 'floatingDock@sun.wxg@gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'sensory-perception@HarlemSquirrel.github.io']"

# SystemD Manager
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'transparent-shell@siroj42.github.io', 'floatingDock@sun.wxg@gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'sensory-perception@HarlemSquirrel.github.io', 'systemd-manager@hardpixel.eu']"

# Tiling Assistant 
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'transparent-shell@siroj42.github.io', 'floatingDock@sun.wxg@gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'sensory-perception@HarlemSquirrel.github.io', 'systemd-manager@hardpixel.eu', 'tiling-assistant@leleat-on-github']"
dconf write /org/gnome/mutter/edge-tiling false
dconf write /org/gnome/shell/overrides/edge-tiling false

# Tweaks & Extensions in System Menu
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'transparent-shell@siroj42.github.io', 'floatingDock@sun.wxg@gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'sensory-perception@HarlemSquirrel.github.io', 'systemd-manager@hardpixel.eu', 'tiling-assistant@leleat-on-github', 'tweaks-system-menu@extensions.gnome-shell.fifi.org']"

# Blur my Shell
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'floatingDock@sun.wxg@gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'sensory-perception@HarlemSquirrel.github.io', 'systemd-manager@hardpixel.eu', 'tiling-assistant@leleat-on-github', 'tweaks-system-menu@extensions.gnome-shell.fifi.org']"
dconf write /org/gnome/shell/disabled-extensions "['transparent-shell@siroj42.github.io']"
dconf write /org/gnome/shell/enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'arcmenu@arcmenu.com', 'quake-mode@repsac-by.github.com', 'floatingDock@sun.wxg@gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'sensory-perception@HarlemSquirrel.github.io', 'systemd-manager@hardpixel.eu', 'tiling-assistant@leleat-on-github', 'tweaks-system-menu@extensions.gnome-shell.fifi.org', 'blur-my-shell@aunetx']"
#############################################################################################################################################
# Teclado
#dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'es+winkeys')]"

# Ventanas
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,maximize,close'"
dconf write /org/gnome/mutter/center-new-windows true

# Tema
dconf write /org/gnome/desktop/interface/gtk-theme "'WhiteSur-dark'"
dconf write /org/gnome/shell/extensions/user-theme/name "'WhiteSur-dark'"
dconf write /org/gnome/desktop/interface/cursor-theme "'WhiteSur-cursors'"
dconf write /org/gnome/desktop/interface/icon-theme "'WhiteSur-grey-dark'"

# Wallpaper
dconf write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/wallpapers/Landscapes/landscapes%2001.jpg'"

# Establecer fuentes
dconf write /org/gnome/desktop/interface/font-name "'Noto Sans CJK HK 11'"
dconf write /org/gnome/desktop/interface/document-font-name "'Noto Sans CJK HK 11'"
dconf write /org/gnome/desktop/interface/monospace-font-name "'Monospace 10'"
dconf write /org/gnome/desktop/wm/preferences/titlebar-font "'Noto Sans CJK HK Bold 11'"

# Aplicaciones favoritas
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Evolution.desktop', 'libreoffice-calc.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'brave-browser.desktop', 'org.qbittorrent.qBittorrent.desktop', 'code.desktop', 'codeblocks.desktop', 'Alacritty.desktop', 'clementine.desktop', 'vlc.desktop', 'org.gnome.tweaks.desktop']"

# Nautilus
dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'small'"
# Suspender
# En 2 horas enchufado
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout 7200
# En 30 minutos con bateria
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-timeout 1800
#############################################################################################################################################

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