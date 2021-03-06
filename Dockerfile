FROM ubuntu:latest

# wget, make and libjemalloc1 are needed to download and build Redis' source
RUN apt-get update
RUN apt-get install -y wget make libjemalloc1 gcc

# Download Redis' Source
RUN wget http://download.redis.io/redis-stable.tar.gz
# Extract tar file
RUN tar xvzf redis-stable.tar.gz

WORKDIR redis-stable
# Build and Install Redis
RUN make && make install

# Start redis server on container run
ENTRYPOINT redis-server --protected-mode no
