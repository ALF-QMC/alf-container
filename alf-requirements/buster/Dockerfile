FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:buster-gfortran-blas-lapack-fftw-hdf5-scipy3

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    # For downloading and compiling HDF5
    curl \
    libghc-zlib-dev \
    g++ \
    sudo \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    adduser --disabled-password --gecos "" user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user
