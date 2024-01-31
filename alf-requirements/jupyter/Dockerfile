FROM jupyter/minimal-notebook:latest

USER root

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
    zlib1g-dev \
    g++ \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

WORKDIR "${HOME}"
