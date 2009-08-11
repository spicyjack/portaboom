Template for Antlinux projects
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

What is this?
-------------

This is a set of files and directories that you can use in order to help build
custom initramfs images.

What's here?
------------
template_base.txt - A filelist that contains project-specific files, for
example, all of the files that would go into the /etc directory on the target
project.

initramfs.cfg - A configuration file that helps the make_initramfs.sh script
do it's thing.  Contains a kernel version, a list of packages to include, and
any pre-packaging scripts that need to be run.  This file is sourced from the
make_initramfs.sh script.

etcfiles/ - A directory containing files that would live in the /etc directory
on the target system.  It's only here for organizational purposes.

isolinux/ - A directory containing files used with isolinux; isolinux.cfg, the
config file; banner.txt, the banner shown to the user when the ISO image first
boots; mkisoimg.sh, a sample shell script that runs mkisofs with a nice set of
options.

kernel_configs/ - A directory containing Linux kernel .config files
(config-X.X.XX.X), as well as filelists from Linux kernel Debian packages
(linux-image-X.X.XX.X.txt) and a list of directories to exclude from the final
list of files to include from the kernel packages (sections_to_remove.txt).

scripts/ - A directory containing support scripts for this project
(make_release_files.sh), as well as any scripts that may be used on the target
system.  
