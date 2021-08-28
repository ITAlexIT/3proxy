#!/usr/bin/expect -f
set timeout 3
spawn ufw disable && ufw enable
expect "Command may disrupt existing ssh connections. Proceed with operation"
send -- "y\r"
expect eof
