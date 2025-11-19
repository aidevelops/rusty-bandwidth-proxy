# Use minimal Debian image
FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y libwebp-dev libjxl-dev && rm -rf /var/lib/apt/lists/*

# Copy Rusty Bandwidth binary
COPY rusty-bandwidth /usr/local/bin/rusty-bandwidth

# Expose port for the proxy
EXPOSE 10000

# Run Rusty Bandwidth
CMD ["/usr/local/bin/rusty-bandwidth", "--port", "10000", "--l", "30"]
