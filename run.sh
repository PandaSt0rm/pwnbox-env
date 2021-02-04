#!/bin/bash

ROOTDIR=$(pwd)
TOOLSDIR=
createToolsDirectory () { 
    [ ! -d $ROOTDIR/tools ] && mkdir $ROOTDIR/tools
    TOOLSDIR=$ROOTDIR/tools
}

getGit () {
    if [ -d $TOOLSDIR/$2/$3 ] 
    then
        echo "[+] Updating $3"
        pushd $TOOLSDIR/$2/$3
        git pull
        popd
    else
        echo "[+] Pulling $3"
        git clone $1 $TOOLSDIR/$2/$3
    fi
}

pullGits () {
    getGit https://github.com/21y4d/nmapAutomator.git recon nmapAutomator
}

init () {
    createToolsDirectory
    pullGits
}

init