#!/bin/sh

# Empty all rules
iptables -t filter -F
iptables -t filter -X

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
iptables -t filter -A INPUT -p tcp -s 109.95.212.132 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.133 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.134 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.135 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.136 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.137 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.138 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.212.139 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.211.42  -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.211.40  -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 176.9.49.234   -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 109.95.211.182 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 95.165.131.220 -j ACCEPT #system administrator
#62.76.13.176
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
#iptables -t filter -A INPUT -p tcp --dport 10050 -j ACCEPT

# FTP
#iptables -t filter -A INPUT -p tcp --dport 20:21 -j ACCEPT

# Mail SMTP
iptables -t filter -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 25 -j ACCEPT

