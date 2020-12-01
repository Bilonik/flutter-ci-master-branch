FROM cirrusci/android-sdk:30
LABEL maintainer="admin@horovitz.dev" version="1.0"

USER root
ENV FLUTTER_HOME=${HOME}/sdks/flutter

RUN git clone --branch master https://github.com/flutter/flutter.git


RUN yes | flutter doctor --android-licenses \
    && flutter doctor \
    && chown -R root:root ${FLUTTER_HOME}
    
RUN flutter config --enable-web \
    && sudo apt-get update \
    && sudo apt-get install -y chromium-browser \
    && sudo rm -rf /var/lib/apt/lists/*
