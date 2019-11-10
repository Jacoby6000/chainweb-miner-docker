#!/bin/sh
# miner.sh <account> <pub-key> <node> <cores> [log-level]

echo "Starting Miner"
while true; 
do 
  ./chainweb-miner \
    cpu --cores $MINING_THREADS \
    --log-level=${LOG_LEVEL:-debug} \
    --miner-account=$ACCOUNT_NAME \
    --miner-key=$ACCOUNT_KEY \
    --node=$NODE
  echo "Miner died... restarting in 5"
  sleep 5
done

