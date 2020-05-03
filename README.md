# Docker image for Kafka broker  
  
Choosing a base docker image  
>FROM alpine:3.11.6  
  
Updating alpine default packages  
>RUN apk update && apk upgrade  
>RUN apk add openjdk8=8.242.08-r0  
  
Downloading kafka bins  
ADD https://downloads.apache.org/kafka/2.5.0/kafka_2.12-2.5.0.tgz kafka_2.12-2.5.0.tgz  
  
Unziping kafka files to /etc folder  
>RUN tar -xzvf kafka_2.12-2.5.0.tgz  
>RUN mv kafka_2.12-2.5.0 /etc/kafka  
  
Look for Zookeeper section at server.properties file, it should contains something like zoo:2181,zoo2:2181,zoo3:2181 that actually refers to our zookeeper instances in docker-compose file.  

>COPY server.properties /etc/kafka/config/server.properties  
  
Changing current alpine shell    
>RUN apk add --no-cache --upgrade bash  
>SHELL ["/bin/bash", "-c"]  


zookeeper.connect=zoo:2181,zoo2:2181,zoo3:2181
