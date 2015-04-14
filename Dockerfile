FROM ubuntu:14.04

RUN	mkdir -p /sbin/

COPY my_init /sbin/

RUN chmod +x /sbin/my_init && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:kurento/kurento && \
	apt-get update && \
	apt-get install -y kurento-media-server

EXPOSE 8888

CMD /sbin/my_init
