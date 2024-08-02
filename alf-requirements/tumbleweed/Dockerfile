FROM opensuse/tumbleweed

RUN zypper ref && \
    zypper --non-interactive install  \
    make \
    gcc-fortran \
    gcc-c++ \
    lapack-devel \
    python \
    openmpi4-devel \
    curl \
    awk \
    zlib-devel \
    cmake \
    git \
    sudo \
    && \
    zypper clean \
    && \
    echo /usr/lib64/mpi/gcc/openmpi4/lib64/ | tee /etc/ld.so.conf.d/openmpi4.conf \
    && \
    ldconfig \
    && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

ENV PATH="/usr/lib64/mpi/gcc/openmpi4/bin:$PATH"

USER user
