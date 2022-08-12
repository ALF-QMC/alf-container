#!/bin/bash
# Script for automatically building and pushing the Docker images

# exit when any command fails
set -e

# The image jupyter-pyalf-req derives from jupyter/minimal-notebook
# the other images derive from local images, which is why here is no --pull flag
docker build --pull -t jupyter-pyalf-req jupyter-pyalf-req
names=(jupyter-pyalf-full jupyter-pyalf-doc)

for name in ${names[*]}; do
    docker build -t "${name}" "${name}"
done

for name in jupyter-pyalf-req ${names[*]}; do
    docker tag "${name}" "alfcollaboration/${name}"
    docker push "alfcollaboration/${name}"
    docker tag "${name}" "git.physik.uni-wuerzburg.de:25812/alf/alf_docker/${name}"
    docker push "git.physik.uni-wuerzburg.de:25812/alf/alf_docker/${name}"
done
