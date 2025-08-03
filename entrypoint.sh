#!/bin/bash

# Start geth on localhost:8545
geth --datadir ./data \
  --networkid 2025 \
  --http \
  --http.addr 127.0.0.1 \
  --http.port 8545 \
  --http.api eth,net,web3,personal,miner \
  --allow-insecure-unlock \
  --mine \
  --miner.threads=1 \
  --http.corsdomain="*" \
  --verbosity 3 &

# Start nginx (HTTPS proxy)
nginx -g 'daemon off;'
