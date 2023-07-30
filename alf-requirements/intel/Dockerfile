FROM intel/oneapi-hpckit:latest

# Make sure that there are no questions holding up the build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    sudo \
    # For gzip compressio HDF5
    zlib1g-dev \
    # Helper programs for CI tests
    rdfind \
    symlinks \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user