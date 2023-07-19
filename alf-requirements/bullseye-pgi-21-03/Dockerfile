FROM  git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:bullseye-pgi-21-03

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    python3 \
    # For downloading and compiling HDF5
    curl \
    libghc-zlib-dev \
    sudo \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

RUN ln -s /opt/nvidia/hpc_sdk/Linux_x86_64/21.3/comm_libs/openmpi/openmpi-3.1.5/bin/mpifort /usr/local/bin/mpifort && \
    ln -s /opt/nvidia/hpc_sdk/Linux_x86_64/21.3/comm_libs/openmpi/openmpi-3.1.5/bin/mpiexec /usr/local/bin/mpiexec && \
    ln -s /opt/nvidia/hpc_sdk/Linux_x86_64/21.3/compilers/bin/nvfortran /usr/local/bin/nvfortran

USER user
