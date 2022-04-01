# XNET

WELCOME TO XNET CASH

All instructions you can find on https://www.xnet.cash

#################################################################################
#################################################################################
#################################################################################


Tutorial - Install node on Ubuntu Server 18.04

Install a node for your coin on Ubuntu Server 18.04 with the following tutorial.

Update your Ubuntu server with the following command:
sudo apt-get update && sudo apt-get upgrade -y

Install the required dependencies with the following command:
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-all-dev libboost-program-options-dev libminiupnpc-dev libzmq3-dev libprotobuf-dev protobuf-compiler unzip software-properties-common cmake -y

Install the repository ppa:bitcoin/bitcoin with the following command:
sudo add-apt-repository ppa:bitcoin/bitcoin

Confirm the installation of the repository by pressing on the enter key. enter

Install Berkeley DB with the following command:
sudo apt-get update && sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

Download the Linux daemon for your wallet with the following command:

wget "https://github.com/xnetcash/xnet/blob/main/xnet-daemon-linux.tar.gz" -O xnet-daemon-linux.tar.gz


Extract the tar file with the following command:
tar -xzvf xnet-daemon-linux.tar.gz

Download the Linux tools for your wallet with the following command:

wget "https://github.com/xnetcash/xnet/blob/main/xnet-qt-linux.tar.gz" -O xnet-qt-linux.tar.gz

Extract the tar file with the following command:
tar -xzvf xnet-qt-linux.tar.gz

Type the following command to install the daemon and tools for your wallet:
sudo mv xnetd xnet-cli xnet-tx /usr/bin/

Create the data directory for your coin with the following command:
mkdir $HOME/.xnet

Open nano.
nano $HOME/.xnet/xnet.conf -t

Paste the following into nano.
rpcuser=rpc_xnet
rpcpassword=dadadfsf8s91Adf
rpcbind=0.0.0.0
rpcallowip=127.0.0.1
listen=1
server=1
txindex=1
daemon=1

Save the file with the keyboard shortcut ctrl + x.

Type the following command to start your node:
xnetd


#################################################################################
#################################################################################
#################################################################################


Tutorial - Compile Windows wallet on Ubuntu Server 18.04

Compile a wallet for Microsoft Windows on Ubuntu Server 18.04 with the following tutorial.

Update your Ubuntu server with the following command:
sudo apt-get update && sudo apt-get upgrade -y

Install the required dependencies with the following command:
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 curl libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-all-dev libboost-program-options-dev libminiupnpc-dev libzmq3-dev libgmp3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev unzip doxygen cmake nsis wine-stable wine64 bc -y

Install the repository ppa:bitcoin/bitcoin with the following command:
sudo add-apt-repository ppa:bitcoin/bitcoin

Confirm the installation of the repository by pressing on the enter key. enter

Install Berkeley DB with the following command:
sudo apt-get update && sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

Create your source code directory with the following commands:
cd ~/
mkdir source_code
cd source_code

Download the source code of your coin with the following command:
wget "https://github.com/xnetcash/xnet/blob/main/xnet-source-code.tar.gz" -O xnet-source-code.tar.gz

Type the following command to extract the tar file:
tar -xzvf xnet-source.tar.gz

Type the following command to download the update for QT:
wget https://raw.githubusercontent.com/xnetcash/xnet/main/qt_fix_sha256_pow_021.diff

Type the following command to update QT:
patch -p1 < qt_fix_sha256_pow_021.diff

64-bit

Install the required dependencies with the following command:
sudo apt-get install g++-mingw-w64-x86-64 -y

Set the default x86_64-w64-mingw32-g++ compiler option to posix with the following command:
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix

Build x86_64-w64-mingw32 with the following commands:
PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g')
cd depends
make HOST=x86_64-w64-mingw32
cd ..

Type the following commands to compile your 64 bit wallet for Microsoft Windows.
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
make

32-bit

Type the following command to clean your source code:
make clean

Install the required dependencies with the following command:
sudo apt-get install g++-mingw-w64-i686 mingw-w64-i686-dev -y

Set the default i686-w64-mingw32-gcc and i686-w64-mingw32-g++ compiler option to posix with the following commands.
sudo update-alternatives --set i686-w64-mingw32-gcc /usr/bin/i686-w64-mingw32-gcc-posix
sudo update-alternatives --set i686-w64-mingw32-g++ /usr/bin/i686-w64-mingw32-g++-posix

Build i686-w64-mingw32 with the following commands:
PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g')
cd depends
make HOST=i686-w64-mingw32
cd ..

Type the following commands to compile your 32 bit wallet for Microsoft Windows.
./autogen.sh
CONFIG_SITE=$PWD/depends/i686-w64-mingw32/share/config.site ./configure --prefix=/
make

The compiled wallet for Microsoft Windows is located in the directory src/qt, the tools are located in the directory src.


#################################################################################
#################################################################################
#################################################################################


Tutorial - Mine for blocks with Microsoft Windows

Mine for blocks with your Windows wallet and the following instructions.

First download the file xnet-qt-windows.zip "https://github.com/xnetcash/xnet/blob/main/xnet-qt-windows.zip"

Open File Explorer and go to your downloads directory.

Extract the zip file xnet-qt-windows.zip

Open "Run" with the keyboard shortcut winkey + r.

Enter the following text behind "Open": notepad

Press on the button "OK".

Paste the following into notepad.
rpcuser=rpc_xnet
rpcpassword=dadadfsf8s91Adf
rpcbind=0.0.0.0
rpcallowip=127.0.0.1
listen=1
server=1
addnode=node2.walletbuilders.com

Click on the menu item "File" -> "Save As...".

The open dialog box will appear, click on "Save as type" and select the option "All Files (*.*)".

Enter the following text behind "File name": xnet.conf

Click on the menu bar, type the following text %appdata% and press on the enter key. enter

Create the folder xnet and open the folder.

Press on the button "Save".

Create a new file with the keyboard shortcut ctrl + n.

Paste the following into notepad.
@echo off
set SCRIPT_PATH=%cd%
cd %SCRIPT_PATH%
echo Press [CTRL+C] to stop mining.
:begin
 for /f %%i in ('xnet-cli.exe getnewaddress') do set WALLET_ADDRESS=%%i
 xnet-cli.exe generatetoaddress 1 %WALLET_ADDRESS%
goto begin

Click on the menu item "File" -> "Save As...".

The open dialog box will appear, click on "Save as type" and select the option "All Files (*.*)".

Enter the following text behind "File name": mine.bat

Click on the menu bar, open the location where you extracted the zip file xnet-qt-windows.zip.

Press on the button "Save".

Open your wallet and execute mine.bat to mine your first block.

#################################################################################
#################################################################################
#################################################################################

Tutorial - Mine for blocks with macOS

Mine for blocks with your macOS wallet and the following instructions.

Open Spotlight Search and type the following:
terminal

Double click on terminal.

Execute the following command, to open your downloads directory:
cd Downloads

Install Homebrew with the following command:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

Enter your sudo password to install Homebrew.

Install wget with the following command:
brew install wget

Download your macOS wallet with the following command:
wget "https://xnet.cash/xnet-qt.dmg" -O xnet-qt.dmg

Download the macOS tools for your wallet with the following command:
wget "https://github.com/xnetcash/xnet/blob/main/xnet-tools-macos.tar.gz" -O xnet-tools-macos.tar.gz

Extract the tar file with the following command:
tar -xzvf xnet-tools-macos.tar.gz

Create the data directory for your coin with the following command:
mkdir "$HOME/Library/Application Support/xnet/"

Open nano.
nano "$HOME/Library/Application Support/xnet/xnet.conf" -t

Paste the following into nano.
rpcuser=rpc_xnet
rpcpassword=dadadfsf8s91Adf
rpcbind=0.0.0.0
rpcallowip=127.0.0.1
listen=1
server=1
addnode=node2.walletbuilders.com

Save the file with the keyboard shortcut ctrl + x.

Open nano.
nano mine.sh -t

Paste the following into nano.
#!/bin/bash
SCRIPT_PATH=`pwd`;
cd $SCRIPT_PATH
echo Press [CTRL+C] to stop mining.
while :
do
./xnet-cli generatetoaddress 1 $(./xnet-cli getnewaddress)
done

Save the file with the keyboard shortcut ctrl + x.

Make the file executable.
chmod +x mine.sh

Open your downloads directory in Finder.

Install your macOS wallet with the file xnet-qt.dmg.

Open your wallet.

Go back to your terminal and execute the following command to mine your first block:
./mine.sh

#################################################################################
#################################################################################
#################################################################################


Tutorial - Automated installation and mine for blocks with Microsoft Windows

Install and mine for blocks automatically with your Windows wallet.

The tutorial is only compatible with Windows 10 and above.

First download the file xnet-auto.zip. "https://github.com/xnetcash/xnet/blob/main/xnet-auto.zip"

Open File Explorer and go to your downloads directory.

Extract the zip file xnet-auto.zip

Execute install.bat to automatically install your wallet and mine your first block.

#################################################################################
#################################################################################
#################################################################################


Tutorial - Automated installation and mine for blocks with Ubuntu Desktop

Install and mine for blocks automatically with your Linux wallet.

The tutorial is only compatible with Ubuntu Desktop 18.04 and above.

First download the file xnet-auto.sh. "https://github.com/xnetcash/xnet/blob/main/xnet-auto.sh"

Open a Terminal window.

Make the install file executable with the following command:
chmod +x $HOME/Downloads/xnet-auto.sh

Make .sh files executable with the following command:
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'

Open Files and go to your Downloads directory.

Open xnet-auto.sh and press "Run in Terminal" to automatically install your wallet and mine your first block.


