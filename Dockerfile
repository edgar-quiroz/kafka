FROM alpine:3.11.6

RUN apk update && apk upgrade
RUN apk add openjdk8=8.242.08-r0

ADD https://downloads.apache.org/kafka/2.5.0/kafka_2.12-2.5.0.tgz kafka_2.12-2.5.0.tgz

RUN tar -xzvf kafka_2.12-2.5.0.tgz
RUN mv kafka_2.12-2.5.0 /etc/kafka
COPY server.properties /etc/kafka/config/server.properties

RUN apk add --no-cache --upgrade bash
SHELL ["/bin/bash", "-c"]