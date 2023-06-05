FROM intel/oneapi-hpckit:latest

# Make sure that there are no questions holding up the build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
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

RUN pip install f90nml

# RUN apt-get update && apt-get install -y sudo && \
#     apt-get clean && rm -rf /var/lib/apt/lists/* && \
#     adduser --disabled-password --gecos "" user && \
#     usermod -aG sudo user && \
#     echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/user
# USER user
# WORKDIR "/home/user"
