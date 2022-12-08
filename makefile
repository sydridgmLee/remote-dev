current_dir = $(shell pwd) 
build:
	docker build --platform=linux/amd64 -t remote-dev .

run:
	docker-compose up -d

rsync:
	rsync -a /Users/fridge/dev/images/ssh/* singa-yo:~/containers/remote-dev