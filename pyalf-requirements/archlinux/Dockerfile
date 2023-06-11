FROM alf-requirements:archlinux

RUN pacman -Sy --noconfirm \
    # pyALF dependencies
    git \
    python-h5py \
    python-numpy \
    python-pandas \
    python-matplotlib \
    python-numba \
    python-scipy \
    python-ipywidgets \
    tk \
    python-yaml \
    python-pip \
    && \
    pacman -Sc

RUN pip install f90nml
