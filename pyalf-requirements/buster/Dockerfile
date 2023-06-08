FROM alf-requirements:buster

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
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
