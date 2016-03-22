httpTorBalancer - Rotating Proxies with HAProxy
===============================================

Balance traffic between multiple Tor clients.

Keeps the circuit and returns connections according to onion address.

```
HAProxy <--HTTP-->  DeleGate1 <--socks--> Tor1  <-->  Rendezvous Points
                    DeleGate2 <--socks--> Tor2  <-->  Rendezvous Points
                    ...
                    DeleGate9 <--socks--> Tor9  <-->  Rendezvous Points
```

![Stats GUI](https://raw.githubusercontent.com/ahmia/search/ahmia-redesign/httpTorBalancer/stats.png)


Setup httpTorBalancer
---------------------

- HAProxy
- DeleGate
- Tor in Tor2web mode with fast Tor2webRendezvousPoints

HAProxy and DeleGate

```sh
$ mkdir delegate && cd delegate
$ wget -O delegate.tar.gz http://www.delegate.org/anonftp/DeleGate/bin/linux/9.9.13/linux2.6-dg9_9_13.tar.gz
$ gzip -d < delegate.tar.gz | tar xfv -
```

```sh
$ sudo apt-get install haproxy
$ bash opentors.sh
```

Finally, you can test your HAProxy:

```sh
$ curl -x localhost:3128 http://msydqstlz2kzerdg.onion/
$ http://localhost:5000/stats
```

You can kill your Tors, DeleGates and HAProxy by

```sh
$ killall haproxy
$ killall tor
$ killall delegates
```

Old way to setup with one Polipo proxy
--------------------------------------

- No load balancing, one Tor + proxy instance

```sh
$ sudo apt-get install polipo
$ sudo cp polipo_conf /etc/polipo/config
$ sudo service polipo restart
```
