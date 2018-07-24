FROM ubuntu:18.04

ARG CHEFDK_VERSION=3.1.0
ENV CHEFDK_DOWNLOAD_URL https://packages.chef.io/files/stable/chefdk/${CHEFDK_VERSION}/ubuntu/18.04/chefdk_${CHEFDK_VERSION}-1_amd64.deb
ENV CHEFDK_DOWNLOAD_SHA256 ea5eaf7f729f217f5a33722d5b0a8b2aab6acd8f1f096a474eb44e5419bf3144

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
