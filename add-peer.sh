#!/bin/bash

# Esperar hasta que el nodo esté disponible
until nc -z localhost 3545; do
  echo "Esperando que geth esté disponible..."
  sleep 5
done

cd /root/src

# Conectar a la consola Geth usando attach
./geth attach http://0.0.0.0:3545 << EOF
admin.addPeer("enode://95c1612cb8d9f4ba13567e9c4795d08e44ba7b5d363124a8b038013451b4ceed4b62d19599daff665d043eac9b5a9d532e4afe342f04ac5c93a4149fae58cc39@84.247.128.187:40605")
admin.addPeer("enode://f3cec8126d3eec8bb24dd4bae99986f1995847b5f8c6bfab9c872f6f36d504e073ce1910f639318a475e05ee508ca29b3c8effe2f2c13e989e9647844c786106@185.249.227.142:40605")
admin.addPeer("enode://2201ad4fd7d5da13beab5cd126e8ee1f9bc6a979633a2b00b768bd81bdec976cf3260c476f95c965a9f84976ff3f6f074811454ed885fdd078c36ae850600056@213.199.45.39:40605")
admin.addPeer("enode://7fd711f5c852c29ad11236a06914205dcd67330e18cabafe8b0562753f66a150e04e168a8cf72ef7666a5b5d41b96fd8ca9966f0fa79c640a10534f9e09bc299@213.199.45.11:40605")
admin.addPeer("enode://31b80033bca1089b4f712b668f2b41762dfa094f6eecd939757a3982bdf13be5ea3fe43c71279d1f8b1191bdc695be32cc883632905368066dc8e4222d3bbc2e@213.199.44.8:40605")

EOF
