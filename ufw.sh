wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/user6.rules
wget -P /etc/3proxy/ https://raw.github.com/ITAlexIT/3proxy/master/before.rules
cp -f user.rules /etc/ufw/
cp -f user6.rules /etc/ufw/
cp -f before.rules /etc/ufw/
