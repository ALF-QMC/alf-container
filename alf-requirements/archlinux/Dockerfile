FROM archlinux

RUN pacman -Sy --noconfirm \
    make \
    gcc-fortran \
    lapack \
    python \
    openmpi \
    curl \
    zlib \
    git && \
    pacman -Sc
