build-all-tags:
	docker build -t yoant/docker-texlive:alpine -f alpine.Dockerfile .
	docker build -t yoant/docker-texlive:debian -f Dockerfile .
	docker image tag yoant/docker-texlive:debian yoant/docker-texlive:latest

push-all-tags:
	docker push --all-tags yoant/docker-texlive