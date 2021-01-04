build:
	docker build -t dot_file_builder .

test-run: build
	docker run -it dot_file_builder bash ./dotfiles/install.sh
