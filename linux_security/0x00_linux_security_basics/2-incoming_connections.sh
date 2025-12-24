#!/bin/bash

# Flush existing rules (IPv4)
iptables -F
iptables -X

# Default policies (IPv4)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback (IPv4)
iptables -A INPUT -i lo -j ACCEPT

# Allow established connections (IPv4)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow incoming TCP traffic on port 80 (IPv4)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

echo "Rules updated"

# Flush existing rules (IPv6)
ip6tables -F
ip6tables -X

# Default policies (IPv6)
ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT ACCEPT

# Allow loopback (IPv6)
ip6tables -A INPUT -i lo -j ACCEPT

# Allow established connections (IPv6)
ip6tables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow incoming TCP traffic on port 80 (IPv6)
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT

echo "Rules updated (v6)"
