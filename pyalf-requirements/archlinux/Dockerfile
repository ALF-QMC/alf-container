FROM alf-requirements/archlinux:latest

USER root

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
    python-virtualenv \
    && \
    pacman -Sc --noconfirm

USER user

# Create Python virtual environment to enable installation via pip
RUN python3 -m venv --system-site-packages "/home/user/venv"
ENV PATH="/home/user/venv/bin:$PATH"

RUN pip install f90nml
