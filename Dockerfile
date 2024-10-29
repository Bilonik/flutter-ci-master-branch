FROM node:18.16.0
LABEL maintainer="admin@horovitz.dev" version="1.0"

USER root
ENV FLUTTER_HOME=${HOME}/sdks/flutter \
    FLUTTER_VERSION=$flutter_version
ENV FLUTTER_ROOT=$FLUTTER_HOME

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin
ARG 3.24.3
RUN git clone --branch stable https://github.com/flutter/flutter.git ${FLUTTER_HOME}

RUN yes | flutter doctor --android-licenses \
    && flutter doctor -v \
    && chown -R root:root ${FLUTTER_HOME}

RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && apt-get install -y chromium-browser \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g firebase-tools@8.0.3
