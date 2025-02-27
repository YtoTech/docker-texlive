FROM alpine:3.21
LABEL maintainer="Yoan Tournade <yoan@ytotech.com>"

# Install Texlive: latest release.

# Based on :
# - https://www.tug.org/texlive/quickinstall.html
# - https://github.com/dc-uba/docker-alpine-texlive

# install-tl dependencies.
# GPG is for tlmgr installation source verifications.
RUN apk add --no-cache perl wget tar xz gnupg

# TODO Make textlive.profile a template, so we can configure the installation path.
COPY ./texlive.profile /tmp/
RUN cd /tmp && wget -qO- https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz \
    && /tmp/install-tl*/install-tl -profile /tmp/texlive.profile \
    && rm -rf /tmp/install-tl-*

# Cleanup
# remove install-tl dependencies.
# RUN apk del perl wget tar xz
# But requires to be done all in one RUN/layer?
# Or use multistage?
# https://docs.docker.com/develop/develop-images/multistage-build/

# Add Texlive binaries to path.
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"
