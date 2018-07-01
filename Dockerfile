# TODO Create variation with different based images:
# * 2 last Debian distributions
# * 2 last Ubuntu distributions
# * try an Alpline based image
FROM debian:buster
LABEL maintainer="Yoan Tournade <yoan@ytotech.com>"

# Install Texlive: latest release.

# Based on :
# - https://www.tug.org/texlive/quickinstall.html
# - https://github.com/camilstaps/docker-texlive/blob/master/Dockerfile
# - https://tex.stackexchange.com/questions/1092/how-to-install-vanilla-texlive-on-debian-or-ubuntu

# install-tl dependencies.
# TODO remove/purge them at the end of installation?
RUN apt-get update -qq && apt-get install -y \
    wget \
    libswitch-perl

# TODO Make textlive.profile a template, so we can configure the installation path.
COPY ./texlive.profile /tmp/
RUN cd /tmp && wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz \
    && /tmp//install-tl*/install-tl -profile /tmp/texlive.profile

# Cleanup
# Remove installer.
RUN rm -rf /tmp/install-tl-*
# Clean APT cache.
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add Texlive binaries to path.
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"

# # TODO Variation: another branch/tag.
# # Install fonts.
# COPY ./container/install_fonts.sh /tmp/
# RUN /tmp/install_fonts.sh

# # TODO Variation: another branch/tag.
# # Install Latext packages.
# # TODO Takes a list of packages.
# COPY ./container/install_latex_packages.sh /tmp/
# RUN /tmp/install_latex_packages.sh
