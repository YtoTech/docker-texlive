FROM debian:trixie-20250224
LABEL maintainer="Yoan Tournade <yoan@ytotech.com>"

# Install Texlive: latest release.

# Based on :
# - https://www.tug.org/texlive/quickinstall.html
# - https://tex.stackexchange.com/questions/1092/how-to-install-vanilla-texlive-on-debian-or-ubuntu

# install-tl dependencies.
# GPG is for tlmgr installation source verifications.
RUN apt-get update -qq && apt-get install -y \
    wget \
    libswitch-perl \
    gnupg \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# TODO Make textlive.profile a template, so we can configure the installation path.
COPY ./texlive.profile /tmp/
RUN cd /tmp && wget -qO- https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz \
    && /tmp/install-tl*/install-tl -profile /tmp/texlive.profile \
    && rm -rf /tmp/install-tl-*

# TODO Make a version without tlmgr depencencies included?
# --> Need all to be done in one RUN/layer.
# Remove install-tl dependencies.
# apt-get remove --purge -y \
#     wget \
#     libswitch-perl \
#     && apt-get autoremove --purge -y \
    

# Add Texlive binaries to path.
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"
