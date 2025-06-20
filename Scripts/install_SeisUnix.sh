#!/bin/sh

CWPROOT=$HOME/SeisUnix
#export CWPROOT=CWPROOT
#export PATH=$HOME/SeisUnix/bin

echo "Create SeisUnix folder"
if ls $HOME/SeisUnix/
then
    echo "OK"
else
    mkdir $HOME/SeisUnix/
fi

echo "Update .bashrc..."
if cat $HOME/.bashrc | grep CWPROOT
then echo "OK"
else echo "export CWPROOT=$HOME/SeisUnix" >> $HOME/.bashrc
     echo "export PATH=$PATH:$HOME/SeisUnix/bin" >> $HOME/.bashrc
fi

sudo dnf -y install make gcc libXmu-devel mesa-libGL-devel mesa-libGLU-devel mesa-libGLw-devel freeglut-devel libXt-devel libXrender-devel libXrandr-devel libXi-devel libXinerama-devel libX11-devel libtirpc libtirpc-devel libXt-devel

tar -xvzf $HOME/Downloads/cwp_su_all_44R28.tgz --directory=$HOME/Downloads

mv $HOME/Downloads/src/ $HOME/SeisUnix
cp $HOME/Downloads/Fedora_install/Scripts/Makefile.config $HOME/SeisUnix/src/

echo "Compilation..."
cd $CWPROOT/src && make install
echo "Xtoolkit..."
cd $CWPROOT/src && make xtinstall
#echo "MGLinstall..."
#cd $CWPROOT/src && make mglinstall
echo "Utils..."
cd $CWPROOT/src && make utils
#echo "XMinstall..."
#cd $CWPROOT/src && make xminstall
#echo "SFinstall..."
#cd $CWPROOT/src && make sfinstall

pause

cd $CWPROOT/src && make remake
cd $CWPROOT/src/tri && make 
cd $CWPROOT/src/Trielas && make
cd $CWPROOT/src/xplot && make
cd $CWPROOT/src/xtri && make
cd $CWPROOT/src/su && make
cd $CWPROOT/src/par && make
cd $CWPROOT/src/Fortran && make remake

#rm -rf $HOME/Downloads/cwp_su_all_44R28.tgz

echo "Finished!!, type in terminal: source ~/.bashrc "
echo "Test for succesfull install: "
echo "suplane | suxwigb title='my first graph' & "

