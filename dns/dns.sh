#! /bin/bash
/etc/init.d/bind9 start
TEST_VAR=$(hostname -I)
PEPE=$(getent hosts proxy | awk '{print $1}')
echo -e "\n 
@           IN      SOA     dns1.torreja.com. henri.uesocc.edu.sv. ( 
                        2018244        ; Serial 
                        604800         ; Refresh
                         86400         ; Retry
                       2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@          IN      NS      dns1.torreja.com.
dns1       IN      A       $TEST_VAR
@          IN      A       $TEST_VAR
www        IN      A       192.168.1.12 " > /etc/bind/db.torreja 

printf "\n\n%s\n\t%s\n\t%s\n%s" "zone \"torreja.com\" {" "type master;" "file \"/etc/bind/db.torreja\";" "};" >> /etc/bind/named.conf.default-zones
named-checkzone -i full torreja.com /etc/bind/db.torreja
/etc/init.d/bind9 restart
hostname -I
tcpdump

