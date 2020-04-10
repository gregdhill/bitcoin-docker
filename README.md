# Bitcoin - Docker

Easily run a four node chain in regression test mode.

```shell
docker-compose up

docker build -t bitcoin .
address=$(docker run --network="host" bitcoin bitcoin-cli -rpcpassword=admin -rpcuser=admin -regtest getnewaddress)
docker run --network="host" bitcoin bitcoin-cli -rpcpassword=admin -rpcuser=admin -regtest generatetoaddress 100 "${address}"
```