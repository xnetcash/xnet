#!/bin/bash
wget "https://github.com/xnetcash/xnet/blob/main/xnet-qt-linux.tar.gz" -O xnet-qt-linux.tar.gz

mkdir $HOME/Desktop/xnet

tar -xzvf xnet-qt-linux.tar.gz --directory $HOME/Desktop/xnet

mkdir $HOME/.xnet

cat << EOF > $HOME/.xnet/xnet.conf
rpcuser=rpc_xnet
rpcpassword=dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2
rpcbind=0.0.0.0
rpcallowip=127.0.0.1
listen=1
server=1
addnode=node2.walletbuilders.com
EOF

cat << EOF > $HOME/Desktop/xnet/start_wallet.sh
#!/bin/bash
SCRIPT_PATH=\`pwd\`;
cd \$SCRIPT_PATH
./xnet-qt
EOF

chmod +x $HOME/Desktop/xnet/start_wallet.sh

cat << EOF > $HOME/Desktop/xnet/mine.sh
#!/bin/bash
SCRIPT_PATH=\`pwd\`;
cd \$SCRIPT_PATH
echo Press [CTRL+C] to stop mining.
while :
do
./xnet-cli generatetoaddress 1 \$(./xnet-cli getnewaddress)
done
EOF

chmod +x $HOME/Desktop/xnet/mine.sh

exec $HOME/Desktop/xnet/xnet-qt &

sleep 15

cd $HOME/Desktop/xnet/

clear

exec $HOME/Desktop/xnet/mine.sh