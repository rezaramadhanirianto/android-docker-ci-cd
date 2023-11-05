FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV VERSION_TOOLS "6200805"

# Copy env file
COPY config.env /tmp/config.env

# Download JDK, GPG & MAKE
RUN . /tmp/config.env && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget unzip openjdk-${JDK_VERSION}-jdk curl git build-essential libssl-dev libreadline-dev zlib1g-dev make && \
    apt-get install -y gnupg

# Install rbenv
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    exec $SHELL

# Install ruby-build as an rbenv plugin
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Set environment variables for Ruby and Android
ENV PATH="/root/.rbenv/bin:/root/.rbenv/shims:$PATH"
ENV ANDROID_HOME=/sdk
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Install ruby with specific version
RUN . /tmp/config.env && \
    rbenv install ${RUBY_VERSION} && \
    rbenv global ${RUBY_VERSION}

# Download and install Android SDK
RUN curl -s https://dl.google.com/android/repository/commandlinetools-linux-${VERSION_TOOLS}_latest.zip > /tools.zip \
    && mkdir -p ${ANDROID_HOME}/cmdline-tools \
    && unzip /tools.zip -d ${ANDROID_HOME}/cmdline-tools \
    && rm -v /tools.zip

# Accept android license
RUN mkdir -p $ANDROID_HOME/licenses/ \
    && echo "8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e\n24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license \
    && echo "84831b9409646a918e30573bab4c9c91346d8abd\n504667f4c0de7af1a06de9f4b1727b84351f2910" > $ANDROID_HOME/licenses/android-sdk-preview-license \
    && yes | ${ANDROID_HOME}/cmdline-tools/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} --licenses >/dev/null

# Download android sdk based on packages.txt
ADD packages.txt /sdk

RUN mkdir -p /root/.android \
    && touch /root/.android/repositories.cfg \
    && ${ANDROID_HOME}/cmdline-tools/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} --update

RUN while read -r package; do PACKAGES="${PACKAGES}${package} "; done < /sdk/packages.txt \
    && ${ANDROID_HOME}/cmdline-tools/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} ${PACKAGES}

CMD ["/bin/bash"]