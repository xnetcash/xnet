# xnet

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
