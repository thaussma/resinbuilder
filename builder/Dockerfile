FROM thaussma/resinbuilder-base

# Create user that can run balena and docker without root
ARG UID=1000
ARG GID=1000

RUN groupadd builder --gid $GID \
    && useradd --uid $UID --gid $GID --create-home builder \
    && echo "builder ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers \
    && usermod -aG docker builder \
    && usermod -aG balena builder

VOLUME ["/resinbuilder"]
WORKDIR /resinbuilder

# Be a builder
USER builder

# Add the buildscript
COPY build.sh .

