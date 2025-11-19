# Use minimal Debian image
FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y libwebp-dev libjxl-dev && rm -rf /var/lib/apt/lists/*

# Copy binary
COPY rusty-bandwidth /usr/local/bin/rusty-bandwidth
RUN chmod +x /usr/local/bin/rusty-bandwidth

# Expose Render-required port
EXPOSE $PORT

# Run using Render's dynamic port
CMD ["/usr/local/bin/rusty-bandwidth", "--port", "${PORT}", "--l", "30"]
