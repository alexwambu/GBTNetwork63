#!/bin/bash

# Start Geth (GBTNetwork)
geth --datadir /data \
  --networkid 999 \
  --http \
  --http.addr 127.0.0.1 \
  --http.port 8545 \
  --http.api eth,net,web3,personal,miner \
  --allow-insecure-unlock \
  --mine \
  --miner.threads=1 \
  --http.corsdomain="*" \
  --verbosity 3 &

# Start NGINX
nginx -g 'daemon off;'

