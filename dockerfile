FROM ubuntu:20.04

RUN apt update && apt install -y \
    git build-essential cmake libuv1-dev libssl-dev libhwloc-dev \
 && git clone https://github.com/xmrig/xmrig.git \
 && cd xmrig && mkdir build && cd build \
 && cmake .. && make -j$(nproc)

COPY config.json /xmrig/build/config.json

WORKDIR /xmrig/build

CMD ["./xmrig"]
