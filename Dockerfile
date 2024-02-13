# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Install sudo and create a non-root user
RUN apt-get update && apt-get install -y sudo && \
    useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu && \
    echo 'ubuntu:ubuntu' | chpasswd

# Configure sudo to allow the user to execute commands without password
RUN echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Update packages and install dependencies
RUN sudo apt-get update -y && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y git curl wget && \
    sudo apt-get install -y python3 python3-pip && \
    sudo apt-get install -y golang-go  && \
    sudo apt-get -y autoremove

# Clone and install BBHTv2
RUN sudo git clone https://github.com/aashishsec/BBHTv2.git && \
    cd BBHTv2 && \
    sudo ./bbhtv2.sh && \
    cd ..

# Clone and install reconftw
RUN sudo git clone https://github.com/six2dez/reconftw && \
    cd reconftw && \
    sudo ./install.sh && \
    cd ..

# Install API Security Testing Tools
RUN sudo wget https://raw.githubusercontent.com/aashishsec/APISecTools/main/APITools.sh && \
    sudo chmod +x APITools.sh && \
    sudo ./APITools.sh

# Specify the user to run commands within the container
USER ubuntu

# Specify the command to run on container start
CMD ["bash"]
