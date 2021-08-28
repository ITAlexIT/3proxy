version=0.8.13
apt-get update && apt-get -y upgrade
apt-get install gcc make git expect -y
wget --no-check-certificate -O 3proxy-${version}.tar.gz https://github.com/z3APA3A/3proxy/archive/${version}.tar.gz
tar xzf 3proxy-${version}.tar.gz
cd 3proxy-${version}
make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://github.com/ITAlexIT/3proxy/raw/master/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
mkdir /var/log/3proxy/
wget --no-check-certificate https://github.com/ITAlexIT/3proxy/raw/master/.proxyauth
chmod 600 /etc/3proxy/.proxyauth
cd /etc/init.d/
wget --no-check-certificate  https://raw.github.com/ITAlexIT/3proxy/master/3proxy
chmod  +x /etc/init.d/3proxy
update-rc.d 3proxy defaults
expect <<END
        set timeout 3
        spawn ufw enable
        expect "Command may disrupt existing ssh connections. Proceed with operation"
        send -- "y\r"
        expect eof
END
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user6.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/before.rules
cp -f /etc/3proxy/user.rules /etc/ufw/
cp -f /etc/3proxy/user6.rules /etc/ufw/
cp -f /etc/3proxy/before.rules /etc/ufw/
#ufw disable && ufw enable
expect <<END
        set timeout 3
        spawn ufw enable
        expect "Command may disrupt existing ssh connections. Proceed with operation"
        send -- "y\r"
        expect eof
END
/etc/init.d/3proxy start
#wget https://raw.github.com/ITAlexIT/3proxy/master/expect.sh
#chmod  +x expect.sh
#./expect.sh
