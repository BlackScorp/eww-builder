DOCKER_BUILD_COMMAND = docker build --tag eww-builder:latest .  --label eww --build-arg FEATURES

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
	docker image rm $$(docker image ls -q -f "label=eww")