FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:bullseye-intel-oneapi-ifort-python3

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    # For testsuite
    cmake \
    # For downloading and compiling HDF5
    curl \
    libghc-zlib-dev \
    g++ \
    # pyALF dependencies
    git \
    python3-pandas \
    python3-matplotlib \
    python3-numba \
    python3-ipywidgets \
    python3-tk \
    python3-yaml \
    python3-pip \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install f90nml
