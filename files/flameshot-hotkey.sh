#!/bin/bash

# This script replaces the default PrintScreen screenshot tool with Flameshot

# Release the PrtScr binding by this command:
grep -q "^Ubuntu 18" /etc/issue && gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot ''
grep -q "^Ubuntu 19" /etc/issue && gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'
grep -q "^Ubuntu 20" /etc/issue && gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'

# Set new custom binding:

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

# Set name:

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'flameshot'

# Set command:

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/flameshot gui'

# Set binding:

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding 'Print'
