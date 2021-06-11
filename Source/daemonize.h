/*
NanoHat OLED example
http://wiki.friendlyarm.com/wiki/index.php/NanoHat_OLED
*/

/*
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
*/



#ifndef __DAEMONIZE__H__
#define __DAEMONIZE__H__

#define DEBUG           1
#define LOG_FILE_NAME   "/tmp/nanohat-oled.log"
#define LOCKFILE        "/var/run/nanohat-oled.pid"

#define PYTHON3_INTERP  "python3.8"
#define PYTHON3_SCRIPT  "bakebit_nanohat_oled.py"

extern int isAlreadyRunning();
extern void daemonize(const char *cmd);


#endif

