IMAGE=docker.io/opencodeco/phpctl-bundle-example

phpctl-bundle: clean
	phpctl bundle $(IMAGE) phpctl-bundle main.php

.PHONY: push
push:
	docker push $(IMAGE)

install:
	mv phpctl-bundle /usr/local/bin

clean:
	rm -rf phpctl-bundle
