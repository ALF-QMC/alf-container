ARG REGISTRY_PREFIX=""
FROM ${REGISTRY_PREFIX}pyalf-requirements/jupyter:latest

USER root
RUN mkdir /var/lib/ALF && \
    chown ${NB_UID}:${NB_GID} /var/lib/ALF
USER ${NB_UID}

RUN (cd /var/lib/ALF && \
    git clone --depth 1 https://github.com/ALF-QMC/ALF.git . && \
    git remote set-branches origin '*' && \
    git fetch --depth=1  \
    )
RUN pip install pyALF

ENV ALF_DIR="/var/lib/ALF"
