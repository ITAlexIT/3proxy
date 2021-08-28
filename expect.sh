#!/usr/bin/expect -f
set timeout 5
spawn ufw enable
expect "Command may disrupt existing ssh connections. Proceed with operation"
send -- "y\r"
expect eof
