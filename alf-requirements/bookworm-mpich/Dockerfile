FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:bookworm-gfortran-blas-lapack-fftw-hdf5

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    libmpich-dev \
    python3 \
    # For downloading and compiling HDF5
    curl \
    zlib1g-dev \
    g++ \
    sudo \
    # Helper programs for CI tests
    rdfind \
    symlinks \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user
