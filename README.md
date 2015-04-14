# KurentoDocker

## Usage

The docker image built form this repository is published in `impactstartups/kurento`, then to pull it run:

```
sudo docker pull impactstartups/kurento
```

The docker image exposes the port 8888 and run the script `my_init`. In order to run a container with this docker image, run:

```
sudo docker run -i -t -p 8888:8888/tcp impactstartups/kurento
```

The script `my_init` accepts 3 parameters:
* `-sA` set the address of the STUN server (e.g. 127.0.0.1). If this is set, also -sP has to be set
* `-sP` set the port of the STUN server (e.g. 3478). If this is set, also -sA has to be set
* `-t` set the address and the port of the TURN server in the form of user:password@address:port(?transport=[udp|tcp|tls])

Therefore, if you want to set a specific STUN or TURN server for your Kurento Media Server, pass the parameters to your container when you run it. For example:

```
sudo docker run -i -t -p 8888:8888/tcp impactstartups/kurento /sbin/my_init -sA 74.125.192.127 -sP 19302 -t kurento:kurento@111.222.333.444:3478
```

The flags `-i` and `-t` are useful to view the logs of the Kurento Media Server process, since the script `my_init` outputs the last part of the `/var/log/kurento-media-server/media-server.log` file and the new logs.
