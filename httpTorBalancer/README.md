httpTorBalancer - Rotating Proxies with HAProxy
===============================================

Balance traffic between multiple Tor clients.

Keeps the circuit and returns connections according to onion address.

Setup httpTorBalancer
---------------------

- Haproxy
- DeleGate
- Tor in Tor2web mode with fast Tor2webRendezvousPoints

```sh
$ sudo apt-get install haproxy
$ sudo cp rotating-tor-proxies.cfg /etc/haproxy/
$ sudo service polipo restart
```

Old way to setup with one Polipo proxy
--------------------------------------

- No load balancing, one Tor + proxy instance

```sh
$ sudo apt-get install polipo
$ sudo cp polipo_conf /etc/polipo/config
$ sudo service polipo restart
```
