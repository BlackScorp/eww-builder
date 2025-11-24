FROM debian:trixie-slim


RUN apt update && apt install -y \
    git rustc cargo pkg-config libcairo2-dev libcairo-gobject2 build-essential libgtk-3-dev libdbusmenu-gtk3-dev

RUN mkdir -p /eww
WORKDIR /eww
RUN git clone --depth=1 https://github.com/elkowar/eww.git .

ARG FEATURES="x11"

RUN cargo build --release --no-default-features --features $FEATURES
