FROM debian:bookworm-slim
# If binary is static you don't need extra libs; if dynamic, install them here
# Example (only if you need system libs):
RUN apt-get update && apt-get install -y libwebp-dev libjxl-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY rusty-bandwidth /app/rusty-bandwidth
RUN chmod +x /app/rusty-bandwidth

EXPOSE 8080
CMD ["./rusty-bandwidth"]
