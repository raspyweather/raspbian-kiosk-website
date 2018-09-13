#!bin/bash
echo "this script installs chromium and creates an autostart for the default installation of raspbian..."
sudo apt install -y chromium-browser ttf-mscorefonts-installer unclutter x11-xserver-utils pv hdparm htop
echo "Installation of packages finished. Now downloading newest version of the startscript"
curl -o /home/pi/.config/lxsession/LXDE-pi https://raw.githubusercontent.com/raspyweather/raspbian-kiosk-website/master/start.sh
echo "now setting up autostart config"

echo "@xscreensaver -no-splash" >> /home/pi/.config/lxsession/LXDE-pi/autostart
echo "@point-rpi" >> /home/pi/.config/lxsession/LXDE-pi/autostart
echo "@unclutter" >> /home/pi/.config/lxsession/LXDE-pi/autostart
echo "@xset s off" >> /home/pi/.config/lxsession/LXDE-pi/autostart
echo "@xset s noblank" >> /home/pi/.config/lxsession/LXDE-pi/autostart
echo "@xset -dpms" >> /home/pi/.config/lxsession/LXDE-pi/autostart
echo "@sh /home/pi/.config/lxsession/LXDE-pi/start.sh" >> /home/pi/.config/lxsession/LXDE-pi/autostart

echo "now creating desktop config"
echo "https://github.com/raspyweather/raspbian-kiosk-website" >>/home/pi/Desktop/url.txt
echo "1" >>/home/pi/Desktop/url.txt

echo "done, restarting."
sudo shutdown -r now
