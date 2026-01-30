FROM ubuntu:26.04

RUN apt-get update
RUN apt-get install cabal-install -y
RUN apt-get install libghc-zlib-dev -y

RUN cabal update
RUN cabal install dhall-1.42.2 --install-method=copy --installdir=/usr/local/bin

RUN rm -rf ~/.cabal

COPY entrypoint.bash /usr/local/bin/


ENTRYPOINT ["entrypoint.bash"]
