#!/usr/bin/expect -f
set timeout 5
spawn ufw enable
expect "Command may disrupt existing ssh connections. Proceed with operation"
send -- "y\r"
expect eof
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user6.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/before.rules
cp -f user.rules /etc/ufw/
cp -f user6.rules /etc/ufw/
cp -f before.rules /etc/ufw/
/etc/init.d/3proxy start
