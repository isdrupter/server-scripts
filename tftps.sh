#!/bin/sh

case $@ in
-l|--list)
netstat -taupen|grep in.tftp|grepips -f|sort -u
;;
*)
echo 'Tftp connections...'
netstat -taupen|grep in.tftp|grepips -f|sort -u|wc -l
;;
esac

exit
