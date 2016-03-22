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
$ sudo service haproxy restart
```

```sh
$ mkdir delegate && cd delegate
$ wget -O delegate.tar.gz http://www.delegate.org/anonftp/DeleGate/bin/linux/9.9.13/linux2.6-dg9_9_13.tar.gz
$ gzip -d < delegate.tar.gz | tar xfv -
$ cd dg*
$ make
```

Old way to setup with one Polipo proxy
--------------------------------------

- No load balancing, one Tor + proxy instance

```sh
$ sudo apt-get install polipo
$ sudo cp polipo_conf /etc/polipo/config
$ sudo service polipo restart
```
