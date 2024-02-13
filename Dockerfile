# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Update packages and install dependencies
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git curl wget && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y golang-go  && \
    apt-get -y autoremove

# Install Python packages
RUN pip3 install arjun bbot

# Clone and install BBHTv2
RUN git clone https://github.com/aashishsec/BBHTv2.git && \
    cd BBHTv2 && \
    ./bbhtv2.sh && \
    cd ..

# Clone and install reconftw
RUN git clone https://github.com/six2dez/reconftw && \
    cd reconftw && \
    ./install.sh && \
    cd ..

# Install API Security Testing Tools
RUN wget https://raw.githubusercontent.com/aashishsec/APISecTools/main/APITools.sh && \
    chmod +x APITools.sh && \
    ./APITools.sh

# Specify the command to run on container start
CMD ["bash"]
