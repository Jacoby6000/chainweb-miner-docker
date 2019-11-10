Configure by settings these env vars:


1. MINING_THREADS
2. LOG_LEVEL (defaults to debug)
3. ACCOUNT_NAME
4. ACCOUNT_KEY
5. NODE

If you leave ACCOUNT_NAME, ACCOUNT_KEY and NODE unset, it will mine with my account on my node.

example run:

```sh
docker run \
  -e "MINING_THREADS=4" \
  -e "NODE=tsundere.waifuwars.org:35090" \
  -e "ACCOUNT_NAME=JayKobe6k" \
  -e "ACCOUNT_KEY=84811e7773ec9f6546d8baaf48c79119414b4bed3bfe752c82af6326e5d6b7ff" \
  jacoby6000/chainweb-miner
```


The image is currently based on nixos so it is quite large. I haven't done the work to remove all of the cruft.
