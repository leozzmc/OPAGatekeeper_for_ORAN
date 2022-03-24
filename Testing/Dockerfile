FROM Ubuntu:18.04

WORKDIR /root
RUN apt-get upate
RUN sudo apt-get install -y git curl vim net-tools
COPY .Deploy_NearRTRIC.sh  .
RUN chmod +x ./Deploy_NearRTRIC
RUN ./Deploy_NearRTRIC


CMD [ "/bin/bash" ]
