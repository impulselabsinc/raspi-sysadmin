# set up wifi for Netgear and poop

# update timezone, locale and keyboard
sudo raspi-config
# set locale to en_US.ISO-8859-1
# change timezone to US/eastern
# change keyboard to 104-key(PC) US

# add pi-top apt repo
sudo echo "deb http://apt.pi-top.com/raspbian/ jessie main" | sudo tee -a /etc/apt/sources.list.d/pi-top.list
cd /tmp
wget http://apt.pi-top.com/apt.pi-top.com.gpg.key
sudo apt-key add apt.pi-top.com.gpg.key
sudo apt-get update

# add pi-top drivers, vim and okteta
sudo apt-get install vim pt-battery pt-hub-controller pt-ipc pt-display wiringpi okteta -y

# update Raspbian
sudo apt-get update
sudo apt-get dist-upgrade -y

# enable SPI and I2C
sudo raspi-config
# go to the interfaces tab
# enable SPI and i2c

# optional USB sound card config- 
# the pi needs to be booted up with the USB sound card inserted or the drivers will not load
sudo vim /usr/share/alsa/alsa.conf
# search for defaults
# change to
# defaults.ctl.card 1
# defaults.pcm.card 1

# ~/.asoundrc is created when the defaults are changed in 'Audio Device Settings' under 'Preferences'
vim ~/.asoundrc
# change following setting 'pcm.!default' and 'ctl.!default' to
# card 1

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
git clone https://github.com/impulselabsinc/raspi-sysadmin
git clone git://github.com/rricharz/pi-top-install
git clone git://github.com/rricharz/pi-top-battery-status

# install 3rd party pitop utils
cd ~/impulselabs/pi-top-install
chmod +x install*
./install-brightness
cd ~/impulselabs/pi-top-battery-status
chmod +x install
./install

# pitop keyboard mappings
mv ~/.config/openbox/lxde-pi-rc.xml ~/.config/openbox/lxde-pi-rc.xml.old
cp ~/impulselabs/raspi-sysadmin/lxde-pi-rc.xml ~/.config/openbox/

