#!/opt/homebrew/bin/fish

cd ~/Scripts/

# bypass Verizon hotspot limits?
sudo cp ./resources/sysctl.plist ~/Library/LaunchAgents/com.jedfox.sysctl.plist
launchctl load ~/Library/LaunchAgents/com.jedfox.sysctl.plist

sudo cp ./resources/path.plist ~/Library/LaunchAgents/com.jedfox.path.plist
launchctl load ~/Library/LaunchAgents/com.jedfox.path.plist

# enable Touch ID for sudo
diff ./resources/pam-sudo-source /etc/pam.d/sudo && \
sudo cp ./resources/pam-sudo /etc/pam.d/sudo
