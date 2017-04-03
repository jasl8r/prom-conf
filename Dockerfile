FROM alpine:3.4
MAINTAINER Jeremy Slater (jasl8r@alum.wpi.edu)

ENV DOCKERIZE_VERSION v0.3.0

RUN apk --no-cache add openssl \
 && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ADD prometheus.yml.tmpl /

VOLUME /etc/prom-conf

CMD ["dockerize", \
	 "-template", "/prometheus.yml.tmpl:/etc/prom-conf/prometheus.yml"]
