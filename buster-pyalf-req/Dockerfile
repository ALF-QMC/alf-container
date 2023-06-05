FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:buster-gfortran-blas-lapack-fftw-hdf5-scipy3

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    # Minimal dependencies for ALF
    make \
    gfortran \
    libblas-dev \
    liblapack-dev \
    # MPI
    libopenmpi-dev \
    # For testsuite
    cmake \
    # For downloading and compiling HDF5
    curl \
    libghc-zlib-dev \
    g++ \
    # pyALF dependencies
    git \
    python3-h5py \
    python3-numpy \
    python3-pandas \
    python3-matplotlib \
    python3-numba \
    python3-scipy \
    python3-ipywidgets \
    python3-tk \
    python3-yaml \
    python3-pip \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install f90nml

RUN apt-get update && apt-get install -y sudo && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    adduser --disabled-password --gecos "" user && \
    usermod -aG sudo user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/user
USER user

