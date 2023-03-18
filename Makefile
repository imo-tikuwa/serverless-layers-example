up:
	docker-compose up -d
init:
	docker-compose up -d --build
	docker-compose exec app npm install
	docker-compose exec app bash -c 'npx serverless config credentials --provider aws --key $$AWS_ACCESS_KEY_ID --secret $$AWS_SECRET_ACCESS_KEY'

app:
	docker-compose exec app bash
test-function1:
	docker-compose exec app npx serverless invoke local --function function1
test-function2:
	docker-compose exec app npx serverless invoke local --function function2

deploy:
	docker-compose exec app npx serverless deploy --verbose
remove:
	docker-compose exec app npx serverless remove --verbose

down:
	docker-compose down
down-all:
	docker-compose down --rmi all --volumes --remove-orphans