FROM buildpack-deps:stretch AS build_environment
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN set -eux; \
    \
    url="https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init"; \
    wget "$url"; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --default-toolchain nightly; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version;
USER root
WORKDIR /build
COPY . .
RUN cargo build --release

FROM alpine:latest
COPY --from=build_environment /build/target/release/ekonomi_backend /usr/bin/ekonomi_backend
EXPOSE 8000
CMD ["/usr/bin/ekonomi_backend"]
