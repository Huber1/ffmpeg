FROM ghcr.io/huber1/ffmpeg

WORKDIR /app

RUN dnf install -y \
    rustup \
    gcc

RUN rustup default stable

RUN cargo install ab-av1

ENTRYPOINT ["ab-av1", "$@"]