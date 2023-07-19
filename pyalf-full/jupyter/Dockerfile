FROM pyalf-requirements/jupyter:latest

USER root
RUN mkdir /var/lib/ALF /var/lib/pyALF && \
    fix-permissions /var/lib/ALF && \
    fix-permissions /var/lib/pyALF
USER ${NB_UID}

RUN (cd /var/lib/ALF && git clone --depth 1 https://git.physik.uni-wuerzburg.de/ALF/ALF.git .)
RUN (cd /var/lib/ALF && source ./configure.sh GNU nompi hdf5) && \
    rm -r /tmp/tmp.*
RUN (cd /var/lib/pyALF && git clone https://git.physik.uni-wuerzburg.de/ALF/pyALF.git .)

ENV PATH="/var/lib/pyALF/py_alf/cli:${PATH}"
ENV PYTHONPATH="/var/lib/pyALF:${PYTHONPATH}"
ENV ALF_DIR="/var/lib/ALF"
