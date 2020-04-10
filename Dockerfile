# https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md#ubuntu--debian
FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y

RUN apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
RUN apt-get -y install libevent-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libboost-thread-dev

RUN apt-get -y install libdb-dev libdb++-dev

COPY ./bitcoin /bitcoin
WORKDIR /bitcoin

RUN ./autogen.sh
RUN ./configure --with-incompatible-bdb
RUN make
RUN make install

CMD bitcoind -regtest