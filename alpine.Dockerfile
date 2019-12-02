FROM alpine:3.9
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
RUN cd /tmp && wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz \
    && /tmp/install-tl*/install-tl -profile /tmp/texlive.profile

# Cleanup
RUN \
    # Remove installer.
    rm -rf /tmp/install-tl-*
    # TODO Make an alternative version which
    # remove install-tl dependencies.
    # RUN apk del perl wget tar xz

# Add Texlive binaries to path.
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"
