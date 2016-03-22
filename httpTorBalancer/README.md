httpTorBalancer
===============

Balance traffic between multiple Tor clients and Polipo HTTP proxies.

Keeps the circuit and returns connections according to onion address.

Setup httpTorBalancer
---------------------

- Open 10 Tor clients
- Tor in Tor2web mode with fast Tor2webRendezvousPoints
- Open 10 Polipo proxies
- Socks 19001 --> HTTP proxy 18001 ... socks 19010 --> HTTP proxy 18010


```sh
$ sudo apt-get install polipo
$ sudo cp polipo_conf /etc/polipo/config
$ sudo service polipo restart
```
