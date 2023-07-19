FROM archlinux

RUN pacman -Sy --noconfirm \
    make \
    gcc-fortran \
    lapack \
    python \
    openmpi \
    curl \
    zlib \
    git \
    sudo && \
    pacman -Sc --noconfirm && \
    adduser --disabled-password --gecos "" user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user
