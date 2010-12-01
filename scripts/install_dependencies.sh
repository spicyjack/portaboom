#!/bin/sh

# install the dependencies of all of the Doom packages
sudo apt-get install libsdl-mixer1.2 libsdl-net1.2 libvorbisfile3 \
    libvorbis0a libogg0 libsmpeg0 timidity libwxbase2.8-0 libwxgtk2.8-0 \
    libflac++6 libflac8 libmikmod2 libcurl3 libglew1.5 \
    libgstreamer-plugins-base0.10-0 libgstreamer0.10-0 \
    libartsc0 libjack0 libvorbisenc2 libssh2-1 libfreebob0 libaudio2 \
    freepats libavc1394-0 libiec61883-0 libraw1394-8

# chocolate: libsdl-mixer1.2 libsdl-net1.2 libvorbisfile3 libvorbis0a libogg0
#   libsmpeg0
# deng: libcurl3 libsdl-mixer1.2 libsdl-net1.2 timidity libartsc0
#   libaudio2 libjack0 libvorbisenc2 libssh2-1 libfreebob0 libaudio2
#   freepats libavc1394-0 libiec61883-0 libraw1394-8
# doom-legacy: libsdl-mixer1.2 libsdl-net1.2 libvorbisfile3 libvorbis0a
#   libogg0 libsmpeg0
# edge: libglew1.5 libogg0 libvorbis0a libvorbisfile3
# eternity: libsdl-mixer1.2 libsdl-net1.2
# odamex: libsdl-mixer1.2 libwxbase2.8-0 libwxgtk2.8-0 libsdl-net1.2
#   libgstreamer-plugins-base0.10-0 libgstreamer0.10-0
# prboom: libsdl-mixer1.2 libsdl-net1.2 
# prboom-plus: libsdl-mixer1.2 libsdl-net1.2
# vavoom: libflac++6 libflac8 libmikmod2 libogg0 libsdl-mixer1.2 libvorbis0a
#   libwxbase2.8-0 libwxgtk2.8-0 libgstreamer-plugins-base0.10-0
#   libgstreamer0.10-0
# zdoom: 
