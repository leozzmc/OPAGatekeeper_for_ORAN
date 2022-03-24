FROM ubuntu:18.04

WORKDIR /root
RUN apt-get update
RUN apt-get install -y git curl vim net-tools sudo
COPY ./Deploy_NearRTRIC.sh  .
RUN chmod +x ./Deploy_NearRTRIC.sh
RUN ./Deploy_NearRTRIC.sh


CMD [ "/bin/bash" ]
