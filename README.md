# (Yet another) Texlive Docker image

[![](https://images.microbadger.com/badges/version/yoant/docker-texlive:debian.svg)](https://hub.docker.com/r/yoant/docker-texlive)
[![](https://images.microbadger.com/badges/image/yoant/docker-texlive:debian.svg)](https://microbadger.com/images/yoant/docker-texlive "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/yoant/docker-texlive:alpine.svg)](https://hub.docker.com/r/yoant/docker-texlive)
[![](https://images.microbadger.com/badges/image/yoant/docker-texlive:alpine.svg)](https://microbadger.com/images/yoant/docker-texlive "Get your own image badge on microbadger.com")

A [Docker image](https://hub.docker.com/r/yoant/docker-texlive) based on Debian (Buster) or Alpine (3.9) with the latest vanilla [Texlive](https://www.tug.org/texlive/quickinstall.html) distribution (2019).

This image is used as a based for powering [Latex on HTTP](https://github.com/YtoTech/latex-on-http).

## Texlive

The `scheme-full` is used. See [texlive.profile](texlive.profile) for the configuration used.

## Usage example (Debian-based)

Based on this image, you can then install [CTAN packages](https://ctan.org/) using `tlmgr`.

```Dockerfile
FROM yoant/docker-texlive

tlmgr install babel-spanish
```

## Usage example (Alpine-based)

```Dockerfile
FROM yoant/docker-texlive:alpine

tlmgr install babel-spanish
```

## Reduce image final size

We choose to include `tlmgr` dependencies (perl and wget) in the image,
so we can install CTAN packages right away.
You can reduce your final image size by removing them at the end of your own build:

### Debian-based

```Dockerfile
RUN apt-get remove --purge -y \
    wget \
    libswitch-perl \
    && apt-get autoremove --purge -y
```

### Alpine-based

```Dockerfile
RUN apk del perl wget tar xz
```

--------------------------------

## TODO

* create variations, using tags
  * scheme used
  * TexLive distribution used

## Credits & contributions

Image by Yoan Tournade <yoan@ytotech.com>. PRs and [feedbacks](https://github.com/YtoTech/docker-texlive) welcomed!

Y
