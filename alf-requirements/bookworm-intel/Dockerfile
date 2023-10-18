FROM git.physik.uni-wuerzburg.de:25812/z03/pdi/debian:bookworm-gxx

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    gpg \
    curl \
    ca-certificates \
    zlib1g-dev \
    sudo \
    python3 \
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
    procps \
    # Helper programs for CI tests
    rdfind \
    symlinks \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    useradd -m user && \
    echo '%user ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/user_nopasswd

USER user

# Set environment variables for Intel
ENV TBBROOT=/opt/intel/oneapi/tbb/latest/env/..
ENV ONEAPI_ROOT=/opt/intel/oneapi
ENV PKG_CONFIG_PATH=/opt/intel/oneapi/tbb/latest/env/../lib/pkgconfig:/opt/intel/oneapi/mpi/latest/lib/pkgconfig:/opt/intel/oneapi/mkl/latest/lib/pkgconfig:/opt/intel/oneapi/dpl/latest/lib/pkgconfig:/opt/intel/oneapi/compiler/latest/lib/pkgconfig
ENV ACL_BOARD_VENDOR_PATH=/opt/Intel/OpenCLFPGA/oneAPI/Boards
ENV FPGA_VARS_DIR=/opt/intel/oneapi/compiler/latest/linux/lib/oclfpga
ENV I_MPI_ROOT=/opt/intel/oneapi/mpi/latest
ENV FI_PROVIDER_PATH=/opt/intel/oneapi/mpi/latest//libfabric/lib/prov:/usr/lib64/libfabric
ENV DIAGUTIL_PATH=/opt/intel/oneapi/debugger/latest/sys_check/debugger_sys_check.py:/opt/intel/oneapi/compiler/latest/sys_check/sys_check.sh
ENV DPL_ROOT=/opt/intel/oneapi/dpl/latest
ENV MANPATH=/opt/intel/oneapi/mpi/latest/man:/opt/intel/oneapi/debugger/latest/documentation/man:/opt/intel/oneapi/compiler/latest/documentation/en/man/common::
ENV GDB_INFO=/opt/intel/oneapi/debugger/latest/documentation/info/
ENV SETVARS_COMPLETED=1
ENV CMAKE_PREFIX_PATH=/opt/intel/oneapi/tbb/latest/env/..:/opt/intel/oneapi/compiler/latest/linux/IntelDPCPP
ENV CMPLR_ROOT=/opt/intel/oneapi/compiler/latest
ENV FPGA_VARS_ARGS=
ENV INFOPATH=/opt/intel/oneapi/debugger/latest/gdb/intel64/lib
ENV LIBRARY_PATH=/opt/intel/oneapi/tbb/latest/env/../lib/intel64/gcc4.8:/opt/intel/oneapi/mpi/latest//libfabric/lib:/opt/intel/oneapi/mpi/latest//lib/release:/opt/intel/oneapi/mpi/latest//lib:/opt/intel/oneapi/mkl/latest/lib/intel64:/opt/intel/oneapi/compiler/latest/linux/compiler/lib/intel64_lin:/opt/intel/oneapi/compiler/latest/linux/lib
ENV OCL_ICD_FILENAMES=libintelocl_emu.so:libalteracl.so:/opt/intel/oneapi/compiler/latest/linux/lib/x64/libintelocl.so
ENV CLASSPATH=/opt/intel/oneapi/mpi/latest//lib/mpi.jar
ENV INTELFPGAOCLSDKROOT=/opt/intel/oneapi/compiler/latest/linux/lib/oclfpga
ENV LD_LIBRARY_PATH=/opt/intel/oneapi/tbb/latest/env/../lib/intel64/gcc4.8:/opt/intel/oneapi/mpi/latest//libfabric/lib:/opt/intel/oneapi/mpi/latest//lib/release:/opt/intel/oneapi/mpi/latest//lib:/opt/intel/oneapi/mkl/latest/lib/intel64:/opt/intel/oneapi/debugger/latest/gdb/intel64/lib:/opt/intel/oneapi/debugger/latest/libipt/intel64/lib:/opt/intel/oneapi/debugger/latest/dep/lib:/opt/intel/oneapi/compiler/latest/linux/lib:/opt/intel/oneapi/compiler/latest/linux/lib/x64:/opt/intel/oneapi/compiler/latest/linux/lib/oclfpga/host/linux64/lib:/opt/intel/oneapi/compiler/latest/linux/compiler/lib/intel64_lin
ENV MKLROOT=/opt/intel/oneapi/mkl/latest
ENV NLSPATH=/opt/intel/oneapi/mkl/latest/lib/intel64/locale/%l_%t/%N:/opt/intel/oneapi/compiler/latest/linux/compiler/lib/intel64_lin/locale/%l_%t/%N
ENV PATH="/opt/intel/oneapi/mpi/latest//libfabric/bin:/opt/intel/oneapi/mpi/latest//bin:/opt/intel/oneapi/mkl/latest/bin/intel64:/opt/intel/oneapi/dev-utilities/latest/bin:/opt/intel/oneapi/debugger/latest/gdb/intel64/bin:/opt/intel/oneapi/compiler/latest/linux/lib/oclfpga/bin:/opt/intel/oneapi/compiler/latest/linux/bin/intel64:/opt/intel/oneapi/compiler/latest/linux/bin:$PATH"
ENV INTEL_PYTHONHOME=/opt/intel/oneapi/debugger/latest/dep
ENV CPATH=/opt/intel/oneapi/tbb/latest/env/../include:/opt/intel/oneapi/mpi/latest//include:/opt/intel/oneapi/mkl/latest/include:/opt/intel/oneapi/dpl/latest/linux/include:/opt/intel/oneapi/dev-utilities/latest/include:/opt/intel/oneapi/compiler/latest/linux/lib/oclfpga/include
