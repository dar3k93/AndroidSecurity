#burp setting support invisible proxy
#burp all interface

PROXY_IP=192.168.0.100
PROXY_PORT=8080
PROXY_PORT_2=8081

iptables -t nat -F
iptables -t nat -A OUTPUT -p tcp --dport 443 -j DNAT --to-destination $PROXY_IP:$PROXY_PORT
iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination $PROXY_IP:$PROXY_PORT_2
iptables -t nat -A POSTROUTING -p tcp --dport 443 -j MASQUERADE
iptables -t nat -A POSTROUTING -p tcp --dport 443 -j MASQUERADE

