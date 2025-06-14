# Create Builder image
FROM --platform=$BUILDPLATFORM rust:1.87.0-alpine3.22

# Install required dependencies
RUN apk add --no-cache alpine-sdk musl-dev g++ make openssl-dev openssl-libs-static perl build-base

RUN cargo install cargo-watch --locked

# Create project directory
RUN mkdir -p /project
WORKDIR /project

ENV RUSTFLAGS="-C target-feature=-crt-static"

ENTRYPOINT ["cargo"]
