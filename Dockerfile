# Use the official Flutter image as the base image
FROM cirrusci/flutter:latest

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Get Flutter dependencies
RUN flutter pub get

# Enable Flutter web (optional, if you plan to use Flutter for web)
RUN flutter config --enable-web

# Build the Flutter app (for Android, iOS, or web)
# Uncomment the line below for the platform you want to build for

# For Android
# RUN flutter build apk --release

# For iOS (requires additional setup and is typically done on macOS)
# RUN flutter build ios --release

# For Web
# RUN flutter build web --release

# Expose any ports the app needs (if applicable)
# EXPOSE 8080

# Define the command to run the app (if applicable)
# CMD ["flutter", "run", "--release"]

# Note: Running a Flutter app in a Docker container is typically for CI/CD purposes
# and not for running the app in production. Adjust the build commands as needed.

