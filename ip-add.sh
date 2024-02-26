if [ "$PPP_LOCAL" == "172.17.3.1" ]; then
    sudo route add -net 172.17.0.0/24 gw 172.17.3.1
