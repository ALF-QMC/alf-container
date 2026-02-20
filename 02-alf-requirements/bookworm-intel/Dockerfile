ARG REGISTRY_PREFIX="ghcr.io/alf-qmc/alf-container/"
FROM ${REGISTRY_PREFIX}base-imgs/bookworm

USER root
COPY entrypoint.sh /entrypoint.sh

RUN curl https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null \
    && \
    echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list \
    && \
    apt-get update \
    && \
    apt-get install --yes --no-install-recommends \
    intel-oneapi-compiler-fortran \
    intel-oneapi-mkl \
    intel-oneapi-compiler-dpcpp-cpp \
    intel-oneapi-mpi-devel \
    procps \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh

ENV ALF_HDF5_DIR="/var/lib/ALF_HDF5"
SHELL ["/bin/bash", "-c"]
RUN source /opt/intel/oneapi/setvars.sh && \
    git clone https://github.com/ALF-QMC/ALF.git /tmp/ALF && \
    cd /tmp/ALF && /bin/sh ./configure.sh intelllvm nompi HDF5 && \
    rm -rf /tmp/ALF /tmp/tmp.*
USER user

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
