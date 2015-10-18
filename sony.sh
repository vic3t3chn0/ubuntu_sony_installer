#!/bin/bash
DIR=.

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


function get_Ubuntu(){
phablet-dev-bootstrap -c $DIR
}

function get_Combo(){
source $DIR/build/envsetup.sh
}

function get_Lunch(){
lunch
}


function setup(){
get_Ubuntu
get_Combo
get_Lunch
}

setup
