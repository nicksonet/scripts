#!/bin/sh

# Empty all rules
iptables -t filter -F
iptables -t filter -X

#Forwarding
iptables -I FORWARD -j ACCEPT

# Bloc everything by default
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD ACCEPT
iptables -t filter -P OUTPUT ACCEPT

# Authorize already established connexions
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

# ICMP (Ping)
iptables -t filter -A INPUT -p icmp -j ACCEPT

# SSH
iptables -t filter -A INPUT -p tcp -s 79.132.125.211 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 62.76.13.131 --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.211.90 --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 91.219.24.193 --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 176.9.37.235 --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 46.4.80.103 --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 144.76.106.232 --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 31.44.84.134 -j ACCEPT  #office ip1
iptables -t filter -A INPUT -p tcp -s 31.44.84.135 -j ACCEPT  #office ip2
iptables -t filter -A INPUT -p tcp -s 83.69.207.252 -j ACCEPT  #backup.medbooking.com


iptables -t filter -A INPUT -p tcp -s 109.95.212.132 -j ACCEPT #testpuls.ru
iptables -t filter -A INPUT -p tcp -s 109.95.212.133 -j ACCEPT #sprosiservice.ru
iptables -t filter -A INPUT -p tcp -s 109.95.212.134 -j ACCEPT #crm.medbooking.com
iptables -t filter -A INPUT -p tcp -s 109.95.212.135 -j ACCEPT #
iptables -t filter -A INPUT -p tcp -s 109.95.212.136 -j ACCEPT #call.medbooking.com
iptables -t filter -A INPUT -p tcp -s 109.95.212.137 -j ACCEPT #medbooking.com
iptables -t filter -A INPUT -p tcp -s 109.95.212.139 -j ACCEPT #db2.medbooking.com

iptables -t filter -A INPUT -p tcp -s 88.198.19.201  -j ACCEPT #ast-02
iptables -t filter -A INPUT -p tcp -s 109.95.212.138 -j ACCEPT #ast-01



iptables -t filter -A INPUT -p tcp -s 109.95.211.42  -j ACCEPT #node1
iptables -t filter -A INPUT -p tcp -s 109.95.211.40  -j ACCEPT #node2
iptables -t filter -A INPUT -p tcp -s 176.9.49.234   -j ACCEPT #backup slave | sandbox
iptables -t filter -A INPUT -p tcp -s 109.95.211.182 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 95.165.131.220 -j ACCEPT #system administrator
iptables -t filter -A INPUT -p tcp -s 83.69.207.254  -j ACCEPT #dev.medbooking.com
iptables -t filter -A INPUT -p tcp -s 109.95.211.182 -j ACCEPT #zumber.ru 
iptables -t filter -A INPUT -p tcp -s 176.9.37.235   -j ACCEPT #ansible

iptables -t filter -A INPUT -p tcp -s 172.14.200.0/24 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 172.15.200.0/24 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 172.16.200.0/24 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 172.17.200.0/24 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 172.20.200.0/24 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 192.168.122.0/24 -j ACCEPT
# DNS
iptables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 53 -j ACCEPT

# HTTP
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT

#HTTPS
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT

#mysql
iptables -t filter -A INPUT -p tcp -s 176.9.37.235 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 46.4.80.103 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 144.76.106.232 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 62.76.13.131 --dport 3306 -j ACCEPT #backup.medbooking.com
iptables -t filter -A INPUT -p tcp -s 62.76.13.176 --dport 3306 -j ACCEPT #slave.bd1.medbooking.com
iptables -t filter -A INPUT -p tcp -s 62.76.13.215 --dport 3306 -j ACCEPT #slave.bd2.medbooking.com

iptables -t filter -A INPUT -p tcp -s 109.95.212.132 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.133 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.134 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.135 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.136 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.137 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.138 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.139 --dport 3306 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 176.9.49.234   --dport 3306 -j ACCEPT

#postgresql
iptables -t filter -A INPUT -p tcp -s 176.9.49.234   --dport 5432 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 176.9.49.234   --dport 5433 -j ACCEPT

#oldservers
iptables -t filter -A INPUT -p tcp -s 176.9.37.235 --dport 3307 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 46.4.80.103 --dport 3307 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 144.76.106.232 --dport 3307 -j ACCEPT

iptables -t filter -A INPUT -p tcp -s 176.9.37.235 --dport 3308 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 46.4.80.103 --dport 3308 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 144.76.106.232 --dport 3308 -j ACCEPT

#SNMP
iptables -t filter -A INPUT -p tcp -s 31.44.84.134 --dport 161 -j ACCEPT
iptables -t filter -A INPUT -p udp -s 31.44.84.134 --dport 161 -j ACCEPT

#sandbox
iptables -t filter -A INPUT -p tcp -s 176.9.37.235 --dport 3309 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 46.4.80.103 --dport 3309 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 144.76.106.232 --dport 3309 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 62.76.13.131 --dport 3309 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 107.23.195.228 --dport 3309 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 54.236.224.46 --dport 3309 -j ACCEPT

#ZABBIX
iptables -t filter -A INPUT -p tcp --dport 10050 -j ACCEPT

# FTP
#iptables -t filter -A INPUT -p tcp --dport 20:21 -j ACCEPT

# Mail SMTP
iptables -t filter -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 25 -j ACCEPT

#NAT Translation SlaveDB1
iptables -t nat -I PREROUTING -p tcp -d 176.9.37.235 --dport 2201 -j DNAT --to-destination 192.168.122.2:22
iptables -t nat -I PREROUTING -p tcp -d 176.9.37.235 --dport 3307 -j DNAT --to-destination 192.168.122.2:3306
iptables -t nat -I POSTROUTING -p tcp -s 192.168.122.2 --sport 22 -j SNAT --to-source 176.9.37.235:2201
iptables -t nat -I POSTROUTING -p tcp -s 192.168.122.2 --sport 3306 -j SNAT --to-source 176.9.37.235:3306

#NAT Translation SlaveDB2
iptables -t nat -I PREROUTING -p tcp -d 176.9.37.235 --dport 2202 -j DNAT --to-destination 192.168.122.3:22
iptables -t nat -I PREROUTING -p tcp -d 176.9.37.235 --dport 3308 -j DNAT --to-destination 192.168.122.3:3306
iptables -t nat -I POSTROUTING -p tcp -s 192.168.122.3 --sport 22 -j SNAT --to-source 176.9.37.235:2202
iptables -t nat -I POSTROUTING -p tcp -s 192.168.122.3 --sport 3306 -j SNAT --to-source 176.9.37.235:3307

#NAT Translation Stat
iptables -t nat -I PREROUTING -p tcp -d 176.9.37.235 --dport 2203 -j DNAT --to-destination 192.168.122.4:22
iptables -t nat -I PREROUTING -p tcp -d 176.9.37.235 --dport 3308 -j DNAT --to-destination 192.168.122.4:3306
iptables -t nat -I POSTROUTING -p tcp -s 192.168.122.3 --sport 22 -j SNAT --to-source 176.9.37.235:2203
iptables -t nat -I POSTROUTING -p tcp -s 192.168.122.3 --sport 3306 -j SNAT --to-source 176.9.37.235:3308
