FROM debian:bookworm-slim

RUN apt update && apt install -y curl tar xz-utils unzip git

RUN useradd -d /app -s /bin/bash app

WORKDIR /
RUN curl -o flutter.tar.xz 'https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.5-stable.tar.xz'
RUN tar xf flutter.tar.xz --owner app --group app

USER app
WORKDIR /app

ENV PATH="$PATH:/flutter/bin"
RUN flutter config --no-analytics && flutter precache -f --web
