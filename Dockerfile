FROM alpine:latest


RUN apk update && apk add --no-cache \
    cargo git pkgconf glib pango gtk+3.0-dev gdk-pixbuf cairo glib libgcc rustc-dev libdbusmenu-glib-dev libdbusmenu-gtk3-dev gtk-layer-shell-dev

RUN mkdir -p /eww
WORKDIR /eww
RUN git clone --depth=1 https://github.com/elkowar/eww.git .

ARG FEATURES="x11"

RUN cargo build --release --no-default-features --features $FEATURES
