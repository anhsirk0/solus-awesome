#!/bin/bash

sudo eopkg install -c system.devel -y
sudo eopkg install -y lua \
                      luarocks \
                      make \
                      gobject-introspection \
                      gobject-introspection-devel \
                      pkg-config \
                      gcc \
                      libstdc++ \
                      git \
                      g++ \
                      libcairo-devel \
                      libx11-devel \
                      libxcb-devel \
                      xcb-util-cursor-devel \
                      xcb-util-devel \
                      gdk-pixbuf-devel \
                      xcb-util-keysyms-devel \
                      xcb-util-wm-devel \
                      xcb-util-xrm-devel \
                      libxkbcommon-devel \
                      libstartup-notification-devel \
                      libxdg-basedir-devel

sudo luarocks install lgi

awesome_desktop_entry="[Desktop Entry]
Name=awesomewm
Comment=improved dynamic tiling window manager
Exec=awesome
TryExec=awesome
Type=Application
X-LightDM-DesktopName=awesomeWM
DesktopNames=awesome
Keywords=tiling;wm;windowmanager;window;manager;
"

printf "$awesome_desktop_entry" > awesome.desktop
sudo cp -v awesome.desktop /usr/share/xsessions/
# rm awesome.desktop

git clone https://github.com/awesomeWM/awesome.git --depth 1
cd awesome
make
sudo make install

