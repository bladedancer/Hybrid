#!/bin/sh

# Messaging Service
docker build -t messaging messaging
docker tag messaging:latest bladedancer/messaging
docker push bladedancer/messaging
