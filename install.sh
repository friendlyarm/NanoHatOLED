#!/bin/bash

if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root. Try 'sudo ./install.sh'\n"
  exit 1
fi

gcc Source/daemonize.c Source/main.c -lrt -lpthread -o NanoHatOLED

if [ ! -f /usr/local/bin/oled-start ]; then
    cat >/usr/local/bin/oled-start <<EOL
#!/bin/sh
EOL
    echo "cd $PWD" >> /usr/local/bin/oled-start
    echo "./NanoHatOLED" >> /usr/local/bin/oled-start
    sed -i -e '$i \/usr/local/bin/oled-start &\n' /etc/rc.local
    chmod 755 /usr/local/bin/oled-start
fi


if [ ! -f BakeBit/Script/install.sh ]; then
    git submodule init
    git submodule update
fi

cd BakeBit/Script/
sudo ./install.sh

