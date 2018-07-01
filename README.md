# A Texlive Docker image

A [Docker image](https://hub.docker.com/r/yoant/texlive/) based on Debian (Buster) with the latest vanilla [Texlive](https://www.tug.org/texlive/quickinstall.html) distribution.

This image is used as a based for powering [Latex on HTTP](https://github.com/YtoTech/latex-on-http).

## Texlive

The `scheme-full` is used. See [texlive.profile](texlive.profile) for the configuration used.

## Usage Example

Based on this image, you can install [CTAN packages](https://ctan.org/) using `tlmgr`.

`Dockerfile`
```
FROM debian:buster yoant/texlive

tlmgr install babel-spanish
```

## TODO

* create variations, using tags
  * base version of Debian
  * scheme used

## Credits & Contributions

Image by Yoan Tournade <yoan@ytotech.com>. PRs and [feedbacks](https://github.com/YtoTech/docker-texlive) welcomed!

Y
