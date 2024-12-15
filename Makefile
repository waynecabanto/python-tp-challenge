start:
	podman run -p 8080:8080 --name hello-app hellopy
stop:
	podman stop hello-app
	podman rm hello-app
build:
	podman build -t hellopy .