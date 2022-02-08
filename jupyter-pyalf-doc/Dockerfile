FROM jupyter-pyalf-full

# Install Python 3 packages needed for documentation
RUN mamba install --quiet --yes \
    'jupyter-book' \
    'numpydoc' \
    'sphinx-argparse' \
    && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Change Entrypoint to allow CI scripts
ENTRYPOINT [""]
