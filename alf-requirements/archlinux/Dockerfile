FROM archlinux

RUN pacman -Syu --noconfirm && \
    pacman -Sy --noconfirm \
    make \
    gcc-fortran \
    lapack \
    python \
    openmpi \
    curl \
    zlib \
    git \
    sudo \
    && \
    pacman -Sc --noconfirm && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user
