FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:bookworm-gfortran-blas-lapack-fftw-hdf5-scipy3

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
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh" && \
    bash Mambaforge-$(uname)-$(uname -m).sh -b -p $HOME/mambaforge && \
    rm Mambaforge-$(uname)-$(uname -m).sh && \
    ls $HOME/mambaforge/etc/profile.d/conda.sh && \
    source $HOME/mambaforge/etc/profile.d/conda.sh && \
    export PATH="$HOME/mambaforge/bin:$PATH"
RUN mamba install  --quiet --yes \
    'h5py' \
    'numpy' \
    'pandas' \
    'matplotlib' \
    'numba' \
    'scipy' \
    'ipywidgets' \
    'ipympl' \
    'f90nml' \
    'yaml' \
    && \
    mamba clean --all -f -y
    
