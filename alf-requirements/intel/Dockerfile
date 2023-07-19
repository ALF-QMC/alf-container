FROM intel/oneapi-hpckit:latest

# Make sure that there are no questions holding up the build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    sudo \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    adduser --disabled-password --gecos "" user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user