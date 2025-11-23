DOCKER_BUILD_COMMAND = docker build --tag eww-buider:latest . --build-arg FEATURES

build-x11:
	$(DOCKER_BUILD_COMMAND)=x11
	make download

build-wayland:
	$(DOCKER_BUILD_COMMAND)=wayland
	make download

download:
	docker run -d --name eww eww-builder
	docker cp eww:/eww/target/release/eww .
	docker rm eww