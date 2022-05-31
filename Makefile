
# Install dependencies via poetry
install:
	poetry install

# Run app locally
run:
	uvicorn main:app --reload --host 0.0.0.0 --port 8080

# build Docker image
docker-build:
	docker build -t containerize_tf_model

# run application within Docker container
docker-run:
	docker run -p 8080:80 containerize_tf_model

# Auto-format, sort imports and style code
format:
	poetry run isort .
	poetry run black .

# show linting errors
lint:
	poetry run flake8

all: install format lint

