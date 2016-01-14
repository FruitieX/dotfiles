#sudo route add -net 255.255.255.255 netmask 255.255.255.255 dev tap0 metric 0
sudo ip route add 255.255.255.255 via 10.9.8.100 dev tap0
