FROM debian:12-slim

RUN apt-get update && apt-get install -y \
    wget \
    libssl3 \
    libwebp-dev \
    libbrotli-dev \
    liblcms2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install correct libjxl 0.11 (from old-releases)
RUN wget http://old-releases.ubuntu.com/ubuntu/pool/universe/libj/libjxl/libjxl0.11_0.11.1-1_amd64.deb && \
    apt-get install -y ./libjxl0.11_0.11.1-1_amd64.deb && \
    rm libjxl0.11_0.11.1-1_amd64.deb

COPY rusty-bandwidth /usr/local/bin/rusty-bandwidth
RUN chmod +x /usr/local/bin/rusty-bandwidth

EXPOSE 8080

CMD ["/usr/local/bin/rusty-bandwidth"]
