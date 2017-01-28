FROM ubuntu:14.04

ARG CHEFDK_VERSION=1.1.16
ENV CHEFDK_DOWNLOAD_URL https://packages.chef.io/files/stable/chefdk/${CHEFDK_VERSION}/ubuntu/14.04/chefdk_${CHEFDK_VERSION}-1_amd64.deb
ENV CHEFDK_DOWNLOAD_SHA256 7a1bed7f6eae3ae26694f9d3f47ce76d5e0cbbaba72dafcbc175e89ba0ac6dd9

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends git curl \
      && curl -kfsSL "$CHEFDK_DOWNLOAD_URL" -o chefdk_${CHEFDK_VERSION}-1_amd64.deb \
      && dpkg -i chefdk_${CHEFDK_VERSION}-1_amd64.deb \
      && rm chefdk_${CHEFDK_VERSION}-1_amd64.deb \
      && git config --system user.name "John Doe" \
      && git config --system user.email johndoe@example.com \
      && rm -rf /var/lib/apt/lists/*

VOLUME ["/chef"]
WORKDIR /chef
