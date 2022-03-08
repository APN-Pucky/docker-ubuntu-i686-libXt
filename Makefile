name = apnpucky/ubuntu-i686-libXt
build:
		docker build -t $(name) .
push: build
		docker push $(name)
