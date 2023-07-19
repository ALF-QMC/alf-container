FROM alf-requirements/jupyter:latest

# Install Python 3 packages
RUN mamba install --quiet --yes \
    'h5py' \
    'numpy' \
    'pandas' \
    'matplotlib' \
    'numba' \
    'scipy' \
    'ipywidgets' \
    'ipympl' \
    'f90nml' \
    && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"

RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

USER ${NB_UID}

WORKDIR "${HOME}"
