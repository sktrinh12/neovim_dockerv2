APP_NAME=nvim-docker:latest

build: ## Build the container
	docker build -t $(APP_NAME) .

build-nc: ## Build the container without caching
	docker build --no-cache -t $(APP_NAME) .

run: ## Run container on port configured in `config.env`
	## docker run -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME)
	docker run \
			-i \
			-t \
			--rm \
			-v "/Users/spencertrinh":"/mnt/workspace" \
			--name="nvdkr" \
			$(APP_NAME) \
			"$@"

stop: ## Stop and remove a running container
	docker stop $(APP_NAME); docker rm $(APP_NAME)
