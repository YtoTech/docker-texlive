build-all-tags:
	docker build -t yoant/docker-texlive:alpine -f alpine.Dockerfile .
	docker build -t yoant/docker-texlive:debian -f Dockerfile .
	docker image tag yoant/docker-texlive:debian yoant/docker-texlive:latest

push-all-tags:
	docker image tag yoant/docker-texlive:debian yoant/docker-texlive:debian-2025
	docker image tag yoant/docker-texlive:alpine yoant/docker-texlive:alpine-2025
	docker push --all-tags yoant/docker-texlive