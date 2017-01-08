# set up wifi for Netgear and poop

# update monitor rotation
sudo vi /boot/config.txt 
# 'Shift+G' to go to the en of the file
# 'o' to open a new line
# type in "lcd_rotate=2"
# 'Esc' to exit edit mode
# ':wq' to write and save

# update timezone, locale and keyboard
sudo raspi-config
# set locale to en_US.ISO-8859-1
# change timezone to US/eatern
# change keyboard to 104-key(PC) US

# update Raspbian
sudo apt-get update
sudo apt-get dist-upgrade -y

# install utilities
sudo apt-get install okteta vim -y

# install chromium
wget -qO - http://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -
echo "deb http://dl.bintray.com/kusti8/chromium-rpi jessie main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install chromium-browser rpi-youtube -y

# update chromium regularly
sudo apt-get update
sudo apt-get dist-upgrade
run_omxplayer.py -U

# backup minecraft-pi
sudo cp /opt/minecraft-pi/minecraft-pi /opt/minecraft-pi/minecraft-pi.bak

# download impulselabs content
mkdir ~/impulselabs && cd impulselabs
git clone https://github.com/impulselabsinc/mcgoodies
git clone https://github.com/impulselabsinc/turtle
git clone https://github.com/impulselabsinc/mcturtle
git clone https://github.com/impulselabsinc/mcrender
git clone https://github.com/impulselabsinc/mclabyrinth
git clone https://github.com/impulselabsinc/mcpi
git clone https://github.com/impulselabsinc/minecraft-skins
git clone https://github.com/impulselabsinc/students
