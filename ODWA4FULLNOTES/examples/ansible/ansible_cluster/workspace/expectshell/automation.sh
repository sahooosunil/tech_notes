#!/usr/bin/expect -f
set timeout -1
spawn ./addNumbers.sh
expect -exact "Enter A :"
send -- "10\r"
expect -exact "Enter B :"
send -- "20\r"
expect eof
