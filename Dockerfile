FROM docker/dev-environments-default

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
    build-essential; \
    rm -rf /var/lib/apt/lists/*

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

# Run Rust install script
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y  --no-modify-path --profile minimal
RUN chmod -R a+w $RUSTUP_HOME $CARGO_HOME

# print toolchain versions
RUN rustup --version; \
    cargo --version; \
    rustc --version;

# test
COPY test_cargo test_cargo
RUN cd test_cargo && cargo run
RUN rm -rf test_cargo