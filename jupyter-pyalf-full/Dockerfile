FROM jupyter-pyalf-req

RUN git clone --depth 1 https://git.physik.uni-wuerzburg.de/ALF/ALF.git && \
    (cd ALF && source ./configure.sh GNU nompi hdf5) && \
    rm -r /tmp/tmp.* && \
    git clone https://git.physik.uni-wuerzburg.de/ALF/pyALF.git

ENV PATH="/home/jovyan/pyALF/py_alf/cli:${PATH}"
ENV PYTHONPATH="/home/jovyan/pyALF:${PYTHONPATH}"
ENV ALF_DIR="/home/jovyan/ALF"
