# Android Docker CI CD

<p align="center">
    <img src="https://github.com/rezaramadhanirianto/android-docker-ci-cd/assets/46983732/d0100a65-2a58-4265-9002-d268b2b6f8e3">
</p>

A small docker image for building Android apps. Here's link for [Dockerhub](https://hub.docker.com/r/rezaramadhanirianto/android-docker-ci-cd)

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

### JDK Compatibility version with AGP

| JDK | AGP         |
|-------------|---------------------|
| 8           | < 7.0.0             |
| 11          | >= 7.0.0 && < 8.0.0 |
| 17          | >= 8.0.0            |


### Tags
- <code>:jdk11-sdk33</code>

## How to run in local computer
```docker
docker build image_name:tag .
```