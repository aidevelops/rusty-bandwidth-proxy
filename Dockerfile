FROM ubuntu:23.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies Rusty Bandwidth needs
RUN apt-get update && apt-get install -y \
    libssl3 \
    libwebp-dev \
    libbrotli-dev \
    libjxl-dev \
    liblcms2-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy your binary
COPY rusty-bandwidth /usr/local/bin/rusty-bandwidth

RUN chmod +x /usr/local/bin/rusty-bandwidth

# Expose the default port
EXPOSE 8080

# Run it
CMD ["/usr/local/bin/rusty-bandwidth"]
