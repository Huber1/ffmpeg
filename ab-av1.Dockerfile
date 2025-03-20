FROM ghcr.io/huber1/ffmpeg

WORKDIR /app

RUN dnf install -y gcc

ENV PATH=$PATH:/root/.cargo/bin

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN rustup default stable

RUN cargo install ab-av1

ENTRYPOINT ["ab-av1"]