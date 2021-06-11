## **NanoHat OLED**

Example code of correct use and start for the NanoHat OLED.

Designed specifically to work with the NanoHat OLED:
http://wiki.friendlyarm.com/wiki/index.php/NanoHat_OLED

Currently supported boards (Plug & Play):
* NanoPi NEO
* NanoPi NEO Air
* NanoPi NEO2
* NanoPi NEO Plus2.

Also support other development board with the i2c interface (Need to manually connect).


## Introduction

Aim to compatible with Python3.x and standard C. No Python2.x, no C++.

The original implementation was based on Python2.x, thanks to [CuitGGyy](https://github.com/CuitGGyy/NanoHatOLED) for porting it to Python 3.x environment.


## Installation

#### FriendlyCore Xenial / Armbian Stretch / Ubuntu Core Xenial
Execute the following command in the operating system:

```
# git clone --depth=1 https://github.com/friendlyarm/NanoHatOLED.git
# cd NanoHatOLED
# sudo -H ./install.sh
```

#### FriendlyCore Focal / Armbian Buster / Ubuntu Core Bionic
Execute the following command in the operating system:

```
# git clone --depth=1 https://github.com/friendlyarm/NanoHatOLED.git
# cd NanoHatOLED
# sudo -H ./install-compat.sh
```

The demo will automatically start at the next reboot.


## License

The MIT License (MIT)
Copyright (C) 2017 FriendlyELEC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
