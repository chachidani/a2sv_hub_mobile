.phony: test run run.dev build docker.build docker.run clean

test:
	@echo "A2SV Hub: Running tests..."
	@flutter test

run:
	@echo "A2SV Hub: Running the application..."
	@flutter run

run.dev:
	@echo "A2SV Hub: Running the application in development mode..."
	@flutter run --flavor development

build:
	@echo "A2SV Hub: Building the application..."
	@flutter build apk

docker.build:
	@echo "A2SV Hub: Building Docker image..."
	@docker build -t a2sv_hub_mobile .

docker.run:
	@echo "A2SV Hub: Running Docker container..."
	@docker run -p 8080:8080 a2sv_hub_mobile

clean:
	@echo "A2SV Hub: Cleaning build artifacts..."
	@flutter clean

