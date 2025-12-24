iptables -A INPUT -p tcp --dport 80 -j ACCEPT && echo "Rules updated"
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT && echo "Rules updated (v6)"
