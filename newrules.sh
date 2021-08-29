rm /etc/3proxy/user.rules user.rules.1 user6.rules user6.rules.1 before.rules before.rules.1
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user6.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/before.rules
cp -f /etc/3proxy/user.rules /etc/ufw/
cp -f /etc/3proxy/user6.rules /etc/ufw/
cp -f /etc/3proxy/before.rules /etc/ufw/
ufw disable
sleep 3
expect <<END
        set timeout 3
        spawn ufw enable
        expect "Command may disrupt existing ssh connections. Proceed with operation"
        send -- "y\r"
        expect eof
END
