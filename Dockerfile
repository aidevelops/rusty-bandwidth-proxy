FROM rust:1.78 as builder

# Install dependencies for WebP & JPEG-XL
RUN apt-get update && apt-get install -y \
    libwebp-dev \
    libjxl-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Build in release mode
RUN cargo build --release

# Runtime image
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    libwebp-dev \
    libjxl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /app/target/release/rusty-bandwidth rusty-bandwidth

EXPOSE 8080
CMD ["./rusty-bandwidth"]
