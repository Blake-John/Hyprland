#!/usr/bin/expect -f

spawn bluetoothctl
expect "Agent registered"
send "scan on\r"
expect "Discovery started"
sleep 2
