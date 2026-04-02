FROM intel/fortran-essentials:latest

USER root

ENV ALF_HDF5_DIR="/var/lib/ALF_HDF5"
RUN apt-get update && \
    apt-get install -y \
    sudo \
    zlib1g-dev \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* \
    && \
    git clone --branch 627-ci-pginvhpc-runtime-crash-illegal-instruction-exit-code-132-when-executing-progalfout --depth 1 https://github.com/ALF-QMC/ALF.git /tmp/ALF && cd /tmp/ALF && \
    bash -c 'source ./configure.sh intelllvm nompi HDF5' && \
    rm -rf /tmp/ALF /tmp/tmp.* && \
    groupadd -g 121 user && useradd -m -u 1001 -g 121 user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd
USER user
