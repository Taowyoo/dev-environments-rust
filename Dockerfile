FROM docker/dev-environments-default

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

# Run Rust install script
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y  --no-modify-path --profile minimal

RUN chmod -R a+w $RUSTUP_HOME $CARGO_HOME;
RUN rustup --version; \
    cargo --version; \
    rustc --version;