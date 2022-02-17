#!/bin/sh

x11vnc -forever -usepw -create &

sh authenticate.sh
#sh start_proxy.sh &
#sh maintain.sh
