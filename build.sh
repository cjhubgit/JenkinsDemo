#!/bin/bash

# Build the Docker image
docker build -t jenkinsdemo-image .

# Run the Docker container
docker run --rm jenkinsdemo-image
