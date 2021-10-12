FROM debian:bullseye-slim

RUN apt update && apt upgrade -y \
    && apt -y install wget unzip \
    && rm -rf /var/lib/apt/lists/* \
    && wget --quiet -O /tmp/bitwarden-cli.zip "https://vault.bitwarden.com/download/?app=cli&platform=linux" \
    && unzip /tmp/bitwarden-cli.zip \
    && rm -f /tmp/bitwarden-cli.zip \
    && chmod +x bw

RUN useradd -m -s /bin/bash bw \
    && mkdir -p "/home/bw/.config/Bitwarden CLI" \
    && chown bw:bw "/home/bw/.config/Bitwarden CLI"

USER bw

