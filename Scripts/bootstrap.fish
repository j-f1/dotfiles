#!/usr/local/bin/fish

cd ~/Scripts/

# bypass Verizon hotspot limits
sudo cp ./resources/sysctl.plist /Library/LaunchDaemons/sysctl.plist
launchctl load /Library/LaunchDaemons/sysctl.plist

# enable Touch ID for sudo
diff ./resources/pam-sudo-source /etc/pam.d/sudo && \
sudo cp ./resources/pam-sudo /etc/pam.d/sudo
