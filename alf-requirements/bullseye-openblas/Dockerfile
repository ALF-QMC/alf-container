FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:bullseye-gfortran-openblas-lapack

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    python3 \
    # For downloading and compiling HDF5
    curl \
    libghc-zlib-dev \
    g++ \
    sudo \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user
