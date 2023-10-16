FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:bookworm-gcc

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    gpg \
    curl \
    ca-certificates \
    zlib1g-dev \
    sudo \
    git \
    && \
    curl https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null \
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
    python3 \
    procps \
    g++ \
    # Helper programs for CI tests
    rdfind \
    symlinks \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user
