FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-env -iA nixpkgs.git

RUN git config --global user.email "no@body.com"
RUN git config --global user.name "nobody"


RUN git clone https://github.com/kadena-io/chainweb-node.git
RUN cd chainweb-node && git remote add jwiegley 'https://github.com/jwiegley/chainweb-node.git'
RUN cd chainweb-node && git pull --all
RUN cd chainweb-node && git checkout johnw/blake2
RUN cd chainweb-node && git rebase origin/master

RUN cd chainweb-node && nix-build --keep-failed

ADD miner.sh miner.sh

RUN chmod +x miner.sh

RUN cp ./chainweb-node/result/bin/chainweb-miner ./
RUN rm -rf ./chainweb-node

ENV MINING_THREADS 4
ENV LOG_LEVEL debug
ENV ACCOUNT_NAME JayKobe6k
ENV ACCOUNT_KEY 84811e7773ec9f6546d8baaf48c79119414b4bed3bfe752c82af6326e5d6b7ff
ENV NODE tsundere.waifuwars.org:35090

CMD ./miner.sh
