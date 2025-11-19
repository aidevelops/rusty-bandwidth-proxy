# Use minimal Debian image
FROM debian:bookworm-slim

# Update + install libs needed by Rusty Bandwidth
RUN apt-get update && apt-get install -y \
    libssl3 \
    libwebp-dev \
    libjxl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy app
COPY rusty-bandwidth /usr/local/bin/rusty-bandwidth
RUN chmod +x /usr/local/bin/rusty-bandwidth

# Render dynamically assigns PORT
ENV PORT=10000

EXPOSE ${PORT}

CMD ["/usr/local/bin/rusty-bandwidth", "--port", "${PORT}", "--l", "30"]
