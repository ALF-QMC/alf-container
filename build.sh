#!/bin/bash

images=(
#jupyter-pyalf-req
#jupyter-pyalf-full
#jupyter-pyalf-doc
#buster-pyalf-req
#bullseye-pyalf-req
#bookworm-pyalf-req
#bullseye-intel-pyalf-req
#bullseye-pgi-21-03-pyalf-req
intel-pyalf-req
)
registry="git.physik.uni-wuerzburg.de:25812/alf/alf_docker"

for name in "${images[@]}"; do
    docker build -t "$name" "$name" || exit 1
    docker tag "$name" "$registry/$name" || exit 1
done
for name in "${images[@]}"; do
    docker push "$registry/$name" || exit 1
done
