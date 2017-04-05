#!/usr/bin/env bash
while :; do 
	n=$(checkupdates | wc -l)
	if [ "$n" != "0" ]; then
	    notify.sh -r 1 -t 0 "$n updates available"
	fi
	sleep 30m
done
