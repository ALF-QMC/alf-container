FROM opensuse/tumbleweed

RUN zypper ref && \
    zypper --non-interactive install  \
    make \
    gcc-fortran \
    gcc-c++ \
    lapack-devel \
    python3 \
    mpich-devel \
    curl \
    gawk \
    zlib-devel \
    cmake \
    git \
    sudo \
    valgrind \
    && \
    zypper clean \
    && \
    echo /usr/lib64/mpi/gcc/mpich/lib64/ | tee /etc/ld.so.conf.d/mpich.conf \
    && \
    ldconfig \
    && \
    groupadd -g 121 user && useradd -m -u 1001 -g 121 user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

ENV PATH="/usr/lib64/mpi/gcc/mpich/bin:$PATH"

ENV ALF_HDF5_DIR="/var/lib/ALF_HDF5"
RUN git clone https://github.com/ALF-QMC/ALF.git /tmp/ALF && \
    cd /tmp/ALF && /bin/sh ./configure.sh gnu nompi HDF5 && \
    rm -rf /tmp/ALF /tmp/tmp.*

USER user
