#!bin/bash
echo "this script installs chromium and creates an autostart for the default installation of raspbian..."
sudo apt install -y chromium-browser ttf-mscorefonts-installer unclutter x11-xserver-utils pv hdparm htop
echo "Installation of packages finished. Now downloading newest version of the startscript"
curl -o /etc/xdg/lxsession/LXDE-pi/ https://raw.githubusercontent.com/raspyweather/raspbian-kiosk-website/master/start.sh
echo "now setting up autostart config"

echo "@xscreensaver -no-splash" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@point-rpi" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@unclutter" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@xset s off" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@xset s noblank" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@xset -dpms" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@sh /etc/xdg/lxsession/LXDE-pi/start.sh" >> /etc/xdg/lxsession/LXDE-pi/autostart

echo "now creating desktop config"
echo "https://github.com/raspyweather/raspbian-kiosk-website" >>/home/pi/Desktop/url.txt
echo "1" >>/home/pi/Desktop/url.txt

echo "done, restarting."
sudo shutdown -r now
