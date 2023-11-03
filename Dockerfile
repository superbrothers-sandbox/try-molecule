FROM docker.io/docker:24-cli AS docker-cli

FROM ubuntu:22.04
COPY --from=docker-cli /usr/local/bin/docker /usr/local/bin/
RUN set -x && \
    apt update && apt install -y bash rsync python3 python3-pip --no-install-recommends
RUN set -x && \
    pip3 install molecule==6.0.2 molecule-plugins[docker]==23.5.0
