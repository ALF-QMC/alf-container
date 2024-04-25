FROM pyalf-requirements/jupyter:latest

USER root
RUN mkdir /var/lib/ALF && \
    fix-permissions /var/lib/ALF && \
    chown ${NB_UID} /var/lib/ALF
USER ${NB_UID}

RUN (cd /var/lib/ALF && \
    git clone --depth 1 https://git.physik.uni-wuerzburg.de/ALF/ALF.git . && \
    git remote set-branches origin '*' && \
    git fetch --depth=1 \
    )
RUN (cd /var/lib/ALF && source ./configure.sh GNU nompi hdf5) && \
    rm -r /tmp/tmp.*
RUN pip install pyALF

ENV ALF_DIR="/var/lib/ALF"
