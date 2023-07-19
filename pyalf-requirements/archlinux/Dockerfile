FROM alf-requirements/archlinux:latest

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

# Create Python virtual environment to enable installation via pip
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv --system-site-packages $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install f90nml
