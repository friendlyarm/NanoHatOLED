#!/bin/bash
set -o errexit -o nounset

echo ""
echo "Welcome to NanoHatOLED Installer."
echo ""
echo "Requirements:"
echo "1) Must be connected to the internet"
echo "2) This script must be run as root user"
echo ""
echo "Steps:"
echo "Installs package dependencies:"
echo "  - python3       interactive high-level object-oriented language, python3 version"
#echo "  - python3-dev   header files and a static library for Python3"
echo "  - BakeBit       an open source platform for connecting BakeBit Sensors to the Pi"
echo ""
sleep 3

echo ""
echo "Checking Internet Connectivity..."
echo "================================="
wget -q --tries=2 --timeout=100 http://www.baidu.com -O /dev/null
if [ $? -eq 0 ];then
    echo "Connected"
else
    echo "Unable to Connect, try again !!!"
    exit 0
fi

echo ""
echo "Checking User ID..."
echo "==================="
if [ $(id -u) -eq 0 ]; then
    echo "$(whoami)"
else
    echo "Please run this script as root, try 'sudo ./install.sh'."
    exit 1
fi

echo ""
echo "Checking for Updates..."
echo "======================="
sudo apt-get update --yes

echo ""
echo "Installing Dependencies"
echo "======================="
#sudo apt-get install gcc python3 python3-dev -y
sudo apt-get install gcc python3 -y
echo "Dependencies installed"

if [ ! -f /usr/bin/python3 ]; then
    echo "/usr/bin/python3 not found, exiting."
    exit 1
fi

PY3_INTERP=`readlink /usr/bin/python3`
RET=$?
if [ $? -ne 0 ]; then
    echo "No executable python3, exiting."
    exit 1
fi
REAL_PATH=$(realpath $(dirname $0))
#sed -i '/^#define.*DEBUG.*$/s/1/0/' "${REAL_PATH}/Source/daemonize.h"
sed -i "/^#define.*PYTHON3_INTERP.*$/s/\".*\"/\"${PY3_INTERP}\"/" "${REAL_PATH}/Source/daemonize.h"

echo ""
echo "Compiling with GCC ..."
echo "======================="
gcc Source/daemonize.c Source/main.c -lrt -lpthread -o NanoHatOLED
echo "Compiled NanoHatOLED"

if [ ! -f /usr/local/bin/oled-start ]; then
    cat >/usr/local/bin/oled-start <<EOL
#!/bin/sh
EOL
    echo "cd $PWD" >> /usr/local/bin/oled-start
    echo "./NanoHatOLED" >> /usr/local/bin/oled-start
    sed -i -e '$i \/usr/local/bin/oled-start\n' /etc/rc.local
    chmod 755 /usr/local/bin/oled-start
fi
echo "Make NanoHatOLED autostart."

if [ ! -f BakeBit/install.sh ]; then
    git submodule init
    git submodule update --remote
fi

cd BakeBit/
sudo ./install-compat.sh

