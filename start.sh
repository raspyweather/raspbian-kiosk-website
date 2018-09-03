#!/bin/bash
website=$(head -n 1 /home/pi/Desktop/url.txt) 
zoom=$(head -n 2 /home/pi/Desktop/url.txt | tail -n 1) 
/usr/bin/chromium-browser --incognito --start-maximized --kiosk --force-device-scale-factor=$zoom $website