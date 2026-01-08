FROM docker.io/debian:bookworm

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    make \
    cmake \
    gfortran \
    python3 \
    sudo \
    valgrind \
    # For downloading and compiling HDF5
    curl \
    zlib1g-dev \
    libaec-dev \
    g++ \
    sudo \
    # Helper programs for CI tests
    rdfind \
    symlinks \
    git \
    ca-certificates \
    gpg \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    groupadd -g 121 user && useradd -m -u 1001 -g 121 user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user