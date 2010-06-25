# ########   ###### #####   #####  ######   ######  ######
# ##     ##  ##     ##  ## ##  ## ##    ## ##    ## ##   ##
# ##     ##  ##     ##   ###   ## ##    ## ##    ## ##    ##
# ########   ####   ##    #    ## ##    ## ##    ## ##    ##
# ##    ##   ##     ##         ## ##    ## ##    ## ##    ##
# ##     ##  ##     ##         ## ##    ## ##    ## ##   ##
# ##      ## ###### ##         ##  ######   ######  ######
#                      http://remood.sourceforge.net/
# -----------------------------------------------------------------------------
# Project Leader:    GhostlyDeath           (ghostlydeath@gmail.com)
# Project Co-Leader: RedZTag                (jostol27@gmail.com)
# Members:           Demyx                  (demyx@endgameftw.com)
# -----------------------------------------------------------------------------
# Copyright (C) 2008-2009 The ReMooD Team.
# -----------------------------------------------------------------------------
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# -----------------------------------------------------------------------------
# GNU Makefile

################
### BINARIES ###
################

# Old LLVM Variable
ifdef LLVM
	BINPREFIX2 = $(BINPREFIX)llvm-
	BINPREFIX = $(BINPREFIX2)
endif

CC = $(BINPREFIX)gcc$(BINSUFFIX)
WINDRES = $(BINPREFIX)windres$(BINSUFFIX)

# Detect whether we have deutex or deusf
ifneq (,$(strip $(shell deutex 2>&1 | grep "No command given")))
	DEUTEX = deutex
else
	DEUTEX = deusf
endif

###################
### DIRECTORIES ###
###################

INPUT_SRC  = src
INPUT_ISRC = isrc
INPUT_RC   = rc
INPUT_WAD  = wad
OUTPUT_EXE = bin
OUTPUT_WAD = bin

ifdef ALTERNATEOBJDIR
	OUTPUT_OBJ = $(ALTERNATEOBJDIR)
else
	OUTPUT_OBJ = objs
endif

####################################
### SYSTEM SPECIFIC DECLARATIONS ###
####################################

# Backwards compatibility with the old makefile
ifneq (,$(or $(LINUX), $(WINDOWS), $(MACOS), $(FREEBSD)))
	ifdef LINUX
		OSDETECT_LINUX = 1
		OSHOST_LINUX = 1
	else ifdef WINDOWS
		OSDETECT_WINDOWS = 1
	else ifdef MACOS
		OSDETECT_MACOS = 1
		OSHOST_LINUX = 1
	else ifdef FREEBSD
		OSDETECT_FREEBSD = 1
		OSHOST_LINUX = 1
	else ifdef MSDOS
		OSDETECT_MSDOS = 1
	endif

	OSDETECT_DONTRUNTEST = 1
endif

ifdef FROMLINUX
	COMPILER_UNIXDIRSEP = 1
	OSHOST_LINUX = 1
endif

# We must detect what OS we are running on
ifndef OSDETECT_DONTRUNTEST
	ifeq (Windows_NT,$(OS))											# Windows NT Test
		OSDETECT_WINDOWS = 1
	else ifneq ($(strip $(shell $(CC) -v 2>&1 | grep "Linux")),)	# Linux Test
		OSDETECT_LINUX = 1
	else ifneq ($(strip $(shell $(CC) -v 2>&1 | grep "linux")),)	# Linux Test
		OSDETECT_LINUX = 1
	else ifneq ($(strip $(shell $(CC) -v 2>&1 | grep "FreeBSD")),)	# FreeBSD Test
		OSDETECT_FREEBSD = 1
	else ifneq ($(strip $(shell uname -o 2>&1 | grep "Linux")),)	# Linux uname
		OSDETECT_LINUX = 1
	else ifneq ($(strip $(shell ver 2>&1 | grep "Windows")),)		# Windows ver test
		OSDETECT_WINDOWS = 1
	else ifneq ($(strip $(shell ver 2>&1 | grep "DOS")),)			# DOS ver test
		OSDETECT_MSDOS = 1
	endif
endif

# Detect Host OS
ifeq (Windows_NT,$(OS))												# Windows NT Test
	OSHOST_WINDOWS = 1
else ifneq ($(strip $(shell ver 2>&1 | grep "Windows")),)			# Windows ver test
	OSHOST_WINDOWS = 1
else ifneq ($(strip $(shell ver 2>&1 | grep "DOS")),)				# DOS ver test
	OSHOST_MSDOS = 1
else ifneq ($(strip $(shell uname -o 2>&1 | grep "Linux")),)		# Linux uname
	OSHOST_LINUX = 1
else ifneq ($(strip $(shell uname -o 2>&1 | grep "FreeBSD")),)		# Linux uname
	OSHOST_FREEBSD = 1
endif

# Directory separator and delete command
ifneq (,$(or $(OSHOST_LINUX), $(OSHOST_MACOS), $(OSHOST_FREEBSD)))
	COMPILER_UNIXDIRSEP = 1
	DEL = rm -f
	DELTREE = rm -rf
else
	DEL = del
	DELTREE = del
endif

#################
### SUBSYSTEM ###
#################

# Compatibility
ifdef SDL
	SUBSYSTEM_SDL = 1
endif

# Use SDL as default subsystem
ifndef SUBSYSTEM_SDL
	ifndef SUBSYSTEM_OLDSDL
		ifndef SUBSYSTEM_PALMOS
			SUBSYSTEM_SDL = 1
		endif
	endif
endif

# Interface specific flags
ifdef SUBSYSTEM_SDL				### SDL
	ifdef OSDETECT_WINDOWS		# Windows has problems, no sdl-config
		ifdef SDL_INCLUDE
			CC_SUBSYSTEMCFLAGS = -I$(SDL_INCLUDE)
		else
			CC_SUBSYSTEMCFLAGS = -I. -ISDL
		endif
		
		ifdef SDL_LIB
			CC_SUBSYSTEMLFLAGS = -L$(SDL_LIB)
		else
			CC_SUBSYSTEMLFLAGS = -L. -LSDL
		endif
	else
		CC_SUBSYSTEMCFLAGS = $(shell sdl-config --cflags)
		CC_SUBSYSTEMLFLAGS = $(shell sdl-config --libs)
	endif
	
	CC_SUBSYSTEMDIRECTORY = sdl
else ifdef SUBSYSTEM_OLDSDL		### OLDSDL
	ifdef OSDETECT_WINDOWS		# Windows has problems, no sdl-config
		ifdef SDL_INCLUDE
			CC_SUBSYSTEMCFLAGS = -I$(SDL_INCLUDE)
		else
			CC_SUBSYSTEMCFLAGS = -I. -ISDL
		endif
	
		ifdef SDL_LIB
			CC_SUBSYSTEMLFLAGS = -L$(SDL_LIB)
		else
			CC_SUBSYSTEMLFLAGS = -L. -LSDL
		endif
	else
		CC_SUBSYSTEMCFLAGS = $(shell sdl-config --cflags)
		CC_SUBSYSTEMLFLAGS = $(shell sdl-config --libs)
	endif

	CC_SUBSYSTEMDIRECTORY = oldsdl
else ifdef SUBSYSTEM_PALMOS		### Palm OS
	CC_SUBSYSTEMCFLAGS = 
	CC_SUBSYSTEMLFLAGS = 
	
	CC_SUBSYSTEMDIRECTORY = palmos
endif

#############################
### COMPILER DECLARATIONS ###
#############################

# System Based C Flags
ifdef OSDETECT_WINDOWS
	CC_SYSTEMCFLAGS = -DWIN32 -D_WIN32 -DSDL -DENABLEMULTITHREADING
	CC_SYSTEMLFLAGS = -mwindows -ldxguid -ldinput -ldsound -lddraw -lwinmm -lwsock32 -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -luuid -lodbc32 -lodbccp32 -lSDL.dll
	CC_OBJBASE      = w
else ifdef OSDETECT_MSDOS
	CC_SYSTEMCFLAGS = -D__MSDOS__
	CC_SYSTEMLFLAGS = 
	CC_OBJBASE      = d
else ifdef OSDETECT_LINUX
	CC_SYSTEMCFLAGS = -DLINUX -DDIRECTFULLSCREEN -DSDL -DVID_X11 -DENABLEMULTITHREADING
	CC_SYSTEMLFLAGS = -pthread
	CC_OBJBASE      = l
else ifdef OSDETECT_FREEBSD
	CC_SYSTEMCFLAGS = -DFREEBSD -DDIRECTFULLSCREEN -DSDL -DVID_X11 -DENABLEMULTITHREADING
	CC_SYSTEMLFLAGS = -pthread
	CC_OBJBASE      = f
else ifdef OSDETECT_MACOS
	CC_SYSTEMCFLAGS = 
	CC_SYSTEMLFLAGS = 
	CC_OBJBASE      = m
endif

# Debugging?
ifdef DEBUG
	CC_MODECFLAGS = -g3 -O0 -D_DEBUG
	CC_MODELFLAGS = -g3 -O0
	RC_FLAGS      = -D_DEBUG
else
	CC_MODECFLAGS = -g1 -O2 -DNDEBUG
	CC_MODELFLAGS = -g1 -O2
	RC_FLAGS      = -DNDEBUG
endif

CC_CFLAGS = $(CC_SUBSYSTEMCFLAGS) $(CC_SYSTEMCFLAGS) $(CC_MODECFLAGS) -I$(INPUT_SRC) -I$(INPUT_ISRC)
CC_LFLAGS = $(CC_SUBSYSTEMLFLAGS) $(CC_SYSTEMLFLAGS) $(CC_MODELFLAGS) -I$(INPUT_SRC) -I$(INPUT_ISRC)

############
### MISC ###
############

# EXE Output
ifdef COMPILER_UNIXDIRSEP
	CC_EXEOUTPUT2      = $(OUTPUT_EXE)/remood
	CC_LAUNCHEROUTPUT2 = $(OUTPUT_EXE)/remood-launcher
else
	CC_EXEOUTPUT2      = $(OUTPUT_EXE)\remood
	CC_LAUNCHEROUTPUT2 = $(OUTPUT_EXE)\remood-launcher
endif

ifdef DEBUG
	CC_EXEOUTPUT1      = $(CC_EXEOUTPUT2)-dbg
	CC_LAUNCHEROUTPUT1 = $(CC_LAUNCHEROUTPUT2)-dbg
else
	CC_EXEOUTPUT1      = $(CC_EXEOUTPUT2)
	CC_LAUNCHEROUTPUT1 = $(CC_LAUNCHEROUTPUT2)
endif

ifneq (,$(or $(OSDETECT_WINDOWS), $(OSDETECT_MSDOS)))
	CC_EXEOUTPUT      = $(CC_EXEOUTPUT1).exe
	CC_LAUNCHEROUTPUT = $(CC_LAUNCHEROUTPUT1).exe
else
	CC_EXEOUTPUT       = $(CC_EXEOUTPUT1)
	CC_LAUNCHEROUTPUT = $(CC_LAUNCHEROUTPUT1)
endif

# OBJ Output
ifdef COMPILER_UNIXDIRSEP
	CC_OBJPREFIX2 = $(OUTPUT_OBJ)/$(CC_OBJBASE)
else
	CC_OBJPREFIX2 = $(OUTPUT_OBJ)\$(CC_OBJBASE)
endif

ifdef DEBUG
	CC_OBJPREFIX = $(CC_OBJPREFIX2)d
else
	CC_OBJPREFIX = $(CC_OBJPREFIX2)r
endif

# WAD Output
ifdef COMPILER_UNIXDIRSEP
	CC_WADOUTPUT  = $(OUTPUT_WAD)/remood.wad
	CC_WADOUTPUT2 = ../$(CC_WADOUTPUT)
else
	CC_WADOUTPUT = $(OUTPUT_WAD)\remood.wad
	CC_WADOUTPUT2 = ..\$(CC_WADOUTPUT)
endif

###############
### TARGETS ###
###############

ifdef OSDETECT_WINDOWS
	SYSTEMOBJECTS = $(CC_OBJPREFIX)win32.o
endif

# Object Files
CC_OBJS   = $(SYSTEMOBJECTS) \
			$(CC_OBJPREFIX)dosstr.o \
			$(CC_OBJPREFIX)endtxt.o \
			$(CC_OBJPREFIX)i_cdmus.o \
			$(CC_OBJPREFIX)i_main.o \
			$(CC_OBJPREFIX)i_net.o \
			$(CC_OBJPREFIX)i_sound.o \
			$(CC_OBJPREFIX)i_music.o \
			$(CC_OBJPREFIX)i_system.o \
			$(CC_OBJPREFIX)i_video.o \
			$(CC_OBJPREFIX)am_map.o \
			$(CC_OBJPREFIX)byteptr.o \
			$(CC_OBJPREFIX)command.o \
			$(CC_OBJPREFIX)console.o \
			$(CC_OBJPREFIX)cmp_rle.o \
			$(CC_OBJPREFIX)d_clisrv.o \
			$(CC_OBJPREFIX)dehacked.o \
			$(CC_OBJPREFIX)d_items.o \
			$(CC_OBJPREFIX)d_main.o \
			$(CC_OBJPREFIX)d_net.o \
			$(CC_OBJPREFIX)d_netcmd.o \
			$(CC_OBJPREFIX)d_prof.o \
			$(CC_OBJPREFIX)d_rdf.o \
			$(CC_OBJPREFIX)dstrings.o \
			$(CC_OBJPREFIX)f_finale.o \
			$(CC_OBJPREFIX)f_wipe.o \
			$(CC_OBJPREFIX)g_game.o \
			$(CC_OBJPREFIX)g_input.o \
			$(CC_OBJPREFIX)g_state.o \
			$(CC_OBJPREFIX)hu_stuff.o \
			$(CC_OBJPREFIX)info.o \
			$(CC_OBJPREFIX)i_tcp.o \
			$(CC_OBJPREFIX)i_thread.o \
			$(CC_OBJPREFIX)m_argv.o \
			$(CC_OBJPREFIX)m_bbox.o \
			$(CC_OBJPREFIX)m_cheat.o \
			$(CC_OBJPREFIX)md5.o \
			$(CC_OBJPREFIX)m_fixed.o \
			$(CC_OBJPREFIX)m_menu.o \
			$(CC_OBJPREFIX)m_menudr.o \
			$(CC_OBJPREFIX)m_menufn.o \
			$(CC_OBJPREFIX)m_misc.o \
			$(CC_OBJPREFIX)m_random.o \
			$(CC_OBJPREFIX)m_swap.o \
			$(CC_OBJPREFIX)p_ceilng.o \
			$(CC_OBJPREFIX)p_chex.o \
			$(CC_OBJPREFIX)p_demcmp.o \
			$(CC_OBJPREFIX)p_doors.o \
			$(CC_OBJPREFIX)p_enemy.o \
			$(CC_OBJPREFIX)p_fab.o \
			$(CC_OBJPREFIX)p_floor.o \
			$(CC_OBJPREFIX)p_genlin.o \
			$(CC_OBJPREFIX)p_info.o \
			$(CC_OBJPREFIX)p_inter.o \
			$(CC_OBJPREFIX)p_lights.o \
			$(CC_OBJPREFIX)p_map.o \
			$(CC_OBJPREFIX)p_maputl.o \
			$(CC_OBJPREFIX)p_mobj.o \
			$(CC_OBJPREFIX)p_plats.o \
			$(CC_OBJPREFIX)p_pspr.o \
			$(CC_OBJPREFIX)p_saveg.o \
			$(CC_OBJPREFIX)p_setup.o \
			$(CC_OBJPREFIX)p_sight.o \
			$(CC_OBJPREFIX)p_spec.o \
			$(CC_OBJPREFIX)p_switch.o \
			$(CC_OBJPREFIX)p_telept.o \
			$(CC_OBJPREFIX)p_tick.o \
			$(CC_OBJPREFIX)p_user.o \
			$(CC_OBJPREFIX)r_bsp.o \
			$(CC_OBJPREFIX)r_data.o \
			$(CC_OBJPREFIX)r_draw.o \
			$(CC_OBJPREFIX)r_main.o \
			$(CC_OBJPREFIX)r_plane.o \
			$(CC_OBJPREFIX)r_segs.o \
			$(CC_OBJPREFIX)r_sky.o \
			$(CC_OBJPREFIX)r_splats.o \
			$(CC_OBJPREFIX)r_things.o \
			$(CC_OBJPREFIX)rmd_main.o \
			$(CC_OBJPREFIX)rmd_frgl.o \
			$(CC_OBJPREFIX)rmd_func.o \
			$(CC_OBJPREFIX)screen.o \
			$(CC_OBJPREFIX)sounds.o \
			$(CC_OBJPREFIX)s_amb.o \
			$(CC_OBJPREFIX)s_sound.o \
			$(CC_OBJPREFIX)sb_bar.o \
			$(CC_OBJPREFIX)st_lib.o \
			$(CC_OBJPREFIX)st_stuff.o \
			$(CC_OBJPREFIX)tables.o \
			$(CC_OBJPREFIX)t_func.o \
			$(CC_OBJPREFIX)t_oper.o \
			$(CC_OBJPREFIX)t_parse.o \
			$(CC_OBJPREFIX)t_prepro.o \
			$(CC_OBJPREFIX)t_script.o \
			$(CC_OBJPREFIX)t_spec.o \
			$(CC_OBJPREFIX)t_vari.o \
			$(CC_OBJPREFIX)t_comp.o \
			$(CC_OBJPREFIX)v_video.o \
			$(CC_OBJPREFIX)wi_stuff.o \
			$(CC_OBJPREFIX)w_wad.o \
			$(CC_OBJPREFIX)z_zone.o
			
release:	$(CC_OBJS)
			$(CC) -o $(CC_EXEOUTPUT) $(CC_OBJS) $(CC_LFLAGS)

all:		release
			

clean:		
			$(DEL) $(CC_OBJS) $(CC_EXEOUTPUT)

clean-wad:
			$(DEL) $(CC_WADOUTPUT)

wad:		clean-wad
			(cd wad; $(DEUTEX) -rgb 0 255 255 -doom2 bootstrap -build wadinfo.txt $(CC_WADOUTPUT2))
			
ifdef OSDETECT_WINDOWS
CC_LAUNCHERCFLAGS = $(CC_MODECFLAGS) -D_WIN32
CC_LAUNCHERLFLAGS = $(CC_MODECFLAGS) -mwindows -lwsock32 -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -luuid -lodbc32 -lodbccp32 -lgdi32 -lcomctl32
	
launcher:	$(CC_OBJPREFIX)launcher.o $(CC_OBJPREFIX)launcherrc.o
			$(CC) -o $(CC_LAUNCHEROUTPUT) $(CC_OBJPREFIX)launcher.o $(CC_OBJPREFIX)launcherrc.o $(CC_LAUNCHERLFLAGS)

$(CC_OBJPREFIX)launcher.o:	util/launcher/w32_lnch.c
							$(CC) -o $(CC_OBJPREFIX)launcher.o -c util/launcher/w32_lnch.c $(CC_LAUNCHERCFLAGS)
								
$(CC_OBJPREFIX)launcherrc.o: util/launcher/w32_lnch.rc
		$(WINDRES) -DMINGWMAKED --input-format=rc -o $(CC_OBJPREFIX)launcherrc.o util/launcher/w32_lnch.rc -O coff $(RC_FLAGS)

endif

ifneq (,$(or $(OSHOST_LINUX), $(OSDETECT_LINUX)))
DEBREMOODVER = $(shell (cat version))
DEBREMOODVERSTRIPPED = $(shell (tr -d . < version))
DEBARCH = $(shell dpkg --print-architecture)
DEBINSTALLEDSIZE2 = $(shell expr $(shell stat -c %s $(WADOUT)) + $(shell stat -c %s $(EXEOUT)))
DEBINSTALLEDSIZE = $(shell expr $(DEBINSTALLEDSIZE2) / 1024)
DEBVER_LIBC = $(shell (dpkg -l libc6 | tail -n 1) | awk '{ print$$3 }')
DEBVER_LIBSDL = $(shell (dpkg -l libsdl1.2debian | tail -n 1) | awk '{ print$$3 }')

debian:		wad release
			if test -d debian; then $(DELTREE) debian; fi				# Remove debian
			
			# Make Tree
			mkdir debian
			mkdir debian/DEBIAN
			mkdir debian/usr
			mkdir debian/usr/share
			mkdir debian/usr/share/applications
			mkdir debian/usr/share/pixmaps
			mkdir debian/usr/share/games
			mkdir debian/usr/share/games/doom
			mkdir debian/usr/share/menu
			mkdir debian/usr/share/doc
			mkdir debian/usr/share/doc/remood
			mkdir debian/usr/games
			
			# Copy our files
			cp $(CC_WADOUTPUT) debian/usr/share/games/doom
			cp $(CC_EXEOUTPUT) debian/usr/games
			cp doc/readme.htm debian/usr/share/doc/remood
			cp doc/scripts.htm debian/usr/share/doc/remood
			cp doc/editing.htm debian/usr/share/doc/remood
			cp doc/protocol.htm debian/usr/share/doc/remood
			cp remood.desktop debian/usr/share/applications
			cp remood.xpm debian/usr/share/pixmaps
			
			# Menu Entry
			echo -e "?package(remood):\\" >> debian/usr/share/menu/remood
			echo -e "needs=\"X11\"\\" >> debian/usr/share/menu/remood
			echo -e "section=\"Games/Action\"\\" >> debian/usr/share/menu/remood
			echo -e "hints=\"Doom,First person\"\\" >> debian/usr/share/menu/remood
			echo -e "title=\"ReMooD\"\\" >> debian/usr/share/menu/remood
			echo -e "command=\"/usr/games/remood -waddir /usr/share/games/doom\"" >> debian/usr/share/menu/remood
			
			# Generate Control File
			echo "Package: remood" >> debian/DEBIAN/control
			echo "Version: $(DEBREMOODVER)" >> debian/DEBIAN/control
			echo "Architecture: $(DEBARCH)" >> debian/DEBIAN/control
			echo "Maintainer: Brian Manning <brian@portaboom.com>" >> debian/DEBIAN/control
			echo "Installed-Size: $(DEBINSTALLEDSIZE)" >> debian/DEBIAN/control
			echo "Depends: libc6 (>= $(DEBVER_LIBC)), libsdl1.2debian (>= $(DEBVER_LIBSDL))" >> debian/DEBIAN/control
			echo "Recommends: doom-wad | doom-wad-shareware | freedoom | freedm | game-data-packager" >> debian/DEBIAN/control
			echo "Section: games" >> debian/DEBIAN/control
			echo "Priority: optional" >> debian/DEBIAN/control
			echo "Homepage: http://remood.sourceforge.net/" >> debian/DEBIAN/control
			echo "Description: ReMooD, a Doom Legacy source port" >> debian/DEBIAN/control
			echo " ReMooD is a source port of the classic first person" >> debian/DEBIAN/control
			echo " shooter named Doom. On a more in-depth inheritance it is based off" >> debian/DEBIAN/control
			echo " Doom Legacy and aims to provide the experience but with more" >> debian/DEBIAN/control
			echo " stability and innovations." >> debian/DEBIAN/control
			
			# Make the .deb
			dpkg-deb -b debian remood_$(DEBREMOODVERSTRIPPED)_$(DEBARCH).deb
endif 

#############
### RULES ###
#############

$(CC_OBJPREFIX)%.o:	$(INPUT_SRC)/%.c
					$(CC) -c $< -o $@ $(CC_CFLAGS)

$(CC_OBJPREFIX)%.o:	$(INPUT_ISRC)/$(CC_SUBSYSTEMDIRECTORY)/%.c
					$(CC) -c $< -o $@ $(CC_CFLAGS)
					
$(CC_OBJPREFIX)win32.o:	$(INPUT_RC)/remood.rc
						$(WINDRES) -DMINGWMAKED --input-format=rc -o $@ $(INPUT_RC)/remood.rc -O coff $(RC_FLAGS)

