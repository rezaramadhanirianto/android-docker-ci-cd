# Android Docker CI CD

<p align="center">
  <img src="https://github.com/rezaramadhanirianto/android-docker-ci-cd/assets/46983732/d0100a65-2a58-4265-9002-d268b2b6f8e3">
</p>

<p align="center">
  <a href="https://hub.docker.com/r/rezaramadhanirianto/android-ci-cd)"><img alt="DockerHub Link" src="https://img.shields.io/badge/image-dockerhub-%23066da5?logo=docker&logoColor=white"/></a>
  <a href="https://github.com/rezaramadhanirianto"><img alt="github link" src="https://img.shields.io/badge/follow%20me-github-green?logo=github"/></a>
</p>

A small docker image for building Android apps.

## What's inside
- Ubuntu 20.0.4
- Java
  - JDK 11
- Python 3
- Ruby 2.7.4
- Android SDKs for platforms:
  - 33
- Android build tools:
  - 33.0.0

## JDK Compatibility version with AGP

| JDK | AGP         |
|-------------|---------------------|
| 8           | < 7.0.0             |
| 11          | >= 7.0.0 && < 8.0.0 |
| 17          | >= 8.0.0            |


## Tags
- <code>:jdk11-sdk33</code>

## Build using local computer
```docker
docker build image_name:tag .
```

## Build using multi platform docker
```docker
docker buildx build -t image_name:tag --platform linux/amd64 .
```