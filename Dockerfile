FROM cirrusci/android-sdk:30
LABEL maintainer="admin@horovitz.dev" version="1.0"

USER root
ENV FLUTTER_HOME=${HOME}/sdks/flutter \
    FLUTTER_VERSION=$flutter_version
ENV FLUTTER_ROOT=$FLUTTER_HOME

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin
ARG 3.10.0-1.4.pre
RUN git clone --branch stable https://github.com/flutter/flutter.git ${FLUTTER_HOME}


RUN yes | flutter doctor --android-licenses \
    && flutter doctor \
    && chown -R root:root ${FLUTTER_HOME}
    
# RUN sudo apt-get update \
#     && sudo apt-get install -y chromium-browser \
#     && sudo rm -rf /var/lib/apt/lists/*
    
RUN flutter doctor -v
