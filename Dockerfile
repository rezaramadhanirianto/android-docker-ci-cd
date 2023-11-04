FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    openjdk-8-jdk \
    ruby \
    wget \
    unzip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/android-sdk && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip -O /tmp/sdk-tools.zip && \
    unzip -d /opt/android-sdk /tmp/sdk-tools.zip && \
    rm /tmp/sdk-tools.zip && \
    yes | /opt/android-sdk/tools/bin/sdkmanager --licenses

RUN /opt/android-sdk/tools/bin/sdkmanager "platforms;android-30" "build-tools;30.0.3"

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/30.0.3

