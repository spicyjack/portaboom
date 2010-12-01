#!/bin/sh

dpkg -l | egrep -i "doom|boom" | egrep -v "deutex|fake-doom|freed|doom-wad|bsp"
