#!/bin/bash
# Requires grepips in $PATH
case $@ in *)

echo -ne "Active Network Connections for $@ :\n----------------------------\n"
netstat -taupenv | grep $@ | grepips -c 2>/dev/null
;;

esac

echo -ne "Total connections:\n----------------------------\n"
netstat -taupenv |grepips -c 2>/dev/null

exit
