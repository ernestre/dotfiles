build:
	docker build -t dot_file_builder .

test-run:
	docker run --rm -it -v $$(pwd):/home/docker/dotfiles dot_file_builder bash ./dotfiles/install.sh
