FROM ubuntu:26.04

RUN apt-get update
RUN apt-get install cabal-install git ca-certificates libghc-zlib-dev -y

RUN git clone https://github.com/nikita-volkov/dhall-haskell.git /tmp/dhall-haskell
RUN cd /tmp/dhall-haskell && git checkout 17773fc56f382a148e285d19c321da2b01eead0d && git submodule update --init --recursive

RUN cabal update
RUN cd /tmp/dhall-haskell && cabal install ./dhall --install-method=copy --installdir=/usr/local/bin

RUN rm -rf ~/.cabal /tmp/dhall-haskell

COPY entrypoint.bash /usr/local/bin/


ENTRYPOINT ["entrypoint.bash"]
