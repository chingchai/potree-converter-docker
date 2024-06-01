FROM ubuntu:22.04

VOLUME ["/input", "/output"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    git \
    wget \
    vim \
    net-tools \
    iputils-ping \
    g++-10 \
    cmake \
    && apt-get clean

WORKDIR /opt

# Install Laszip
COPY LAStools/master/LASzip /opt/LASzip
WORKDIR /opt/LASzip
RUN mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && make && make install && ldconfig

# Install PotreeConverter
ENV CXXFLAGS="-std=c++17"
ENV LDFLAGS="-lstdc++fs"

COPY PotreeConverter /opt/PotreeConverter
WORKDIR /opt/PotreeConverter
RUN mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DLASZIP_INCLUDE_DIRS=/opt/LASzip/dll -DLASZIP_LIBRARY=/opt/LASzip/build/src/liblaszip.so .. && \
    make && make install && ldconfig && \
    cp -r /opt/PotreeConverter/PotreeConverter/resources /opt/PotreeConverter/build/resources

WORKDIR /opt/PotreeConverter/build

# ENTRYPOINT ["./PotreeConverter"]
CMD ["PotreeConverter"]




# WORKDIR /root
# รัน shell เพื่อให้ container ไม่ exit
# CMD ["/bin/bash"]
