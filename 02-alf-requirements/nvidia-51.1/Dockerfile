FROM nvcr.io/nvidia/nvhpc:25.1-devel-cuda12.6-ubuntu22.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    python3 \
    # Helper programs for CI tests
    sudo \
    rdfind \
    symlinks \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    groupadd -g 121 user && useradd -m -u 1001 -g 121 user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

# Disable CUDA support in OpenMPI to avoid issues with CUDA-aware MPI when running on non-CUDA nodes
ENV OMPI_MCA_mpi_cuda_support='0'

ENV ALF_HDF5_DIR="/var/lib/ALF_HDF5"
RUN git clone https://git.physik.uni-wuerzburg.de/ALF/ALF.git /tmp/ALF && \
    cd /tmp/ALF && /bin/sh ./configure.sh pgi nompi HDF5 && \
    rm -rf /tmp/ALF /tmp/tmp.*

USER user
