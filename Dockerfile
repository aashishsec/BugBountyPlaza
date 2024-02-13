# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Install necessary packages and upgrade existing ones
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    && apt-get upgrade -y 

# Install Languages required 
RUN apt install python3
RUN apt install golang-go

# Set up sudo without password prompt
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set working directory
WORKDIR /root

# Copy the script and other files
COPY . /root/

# Install Python packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install arjun bbot


# Clone and install BBHTv2
RUN git clone https://github.com/aashishsec/BBHTv2.git && \
    cd BBHTv2 && \
    sudo ./bbhtv2.sh && \
    cd ..

# Clone and install reconftw
RUN git clone https://github.com/six2dez/reconftw && \
    cd reconftw && \
    sudo ./install.sh && \
    cd ..

# Install waymore
RUN git clone https://github.com/xnl-h4ck3r/waymore.git && \
    cd waymore && \
    sudo python setup.py install && \
    cd ..

# Install API Security Testing Tools
RUN wget https://raw.githubusercontent.com/aashishsec/APISecTools/main/APITools.sh && \
    chmod +x APITools.sh && \
    ./APITools.sh

# Specify the command to run on container start
CMD ["bash"]
