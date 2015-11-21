#!/bin/bash
DIR=.

#get requisites
function get_requisites()
{
	sudo add-apt-repository ppa:phablet-team/tools
	sudo apt-get update
	sudo apt-get install phablet-tools
	sudo apt-get install -y android-tools-*
	sudo apt-get install git gnupg flex bison gperf build-essential \
	zip bzr curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
	libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
	libgl1-mesa-dev g++-multilib mingw32 tofrodos \
	python-markdown libxml2-utils xsltproc zlib1g-dev:i386 schedtool \
	g++-4.8-multilib
}

#fetch Ubuntu
function get_ubuntu(){
phablet-dev-bootstrap -c $DIR
}

#combo
function get_combo(){
source $DIR/build/envsetup.sh
}

#lunch
function get_lunch(){
lunch
}

#git device sony
function git_device(){
git clone https://github.com/vic3t3chn0/sony_device.git $DIR/device/
mv device_sony sony
}

#git device sony
function git_vendor(){
git clone https://github.com/vic3t3chn0/proprietary_vendor_sony.git $DIR/vendor/sony
}
#git kernel msm8974
function git_kernel(){
git clone https://github.com/vic3t3chn0/kernel_amami.git $DIR/kernel/sony/msm8974
}

#clean function
function clobber(){
 make clobber
}

#make function
function mka(){
make
}

#setup
function setup(){
get_ubuntu
git_kernel
git_vendor
git_device
get_combo
get_lunch
clobber
mka
}

#run
setup
