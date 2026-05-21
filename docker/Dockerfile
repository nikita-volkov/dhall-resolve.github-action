FROM ubuntu:26.04

RUN apt-get update
RUN apt-get install cabal-install git ca-certificates libghc-zlib-dev -y

RUN git clone https://github.com/nikita-volkov/dhall-haskell.git /tmp/dhall-haskell
RUN cd /tmp/dhall-haskell && git checkout 620a72252f2a0596f9b8e7f3a7bc1a103388c9a1 && git submodule update --init --recursive

RUN cabal update
RUN cd /tmp/dhall-haskell && cabal install ./dhall --install-method=copy --installdir=/usr/local/bin

RUN rm -rf ~/.cabal /tmp/dhall-haskell

COPY entrypoint.bash /usr/local/bin/


ENTRYPOINT ["entrypoint.bash"]
