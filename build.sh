#!/bin/bash

names=(
alf-requirements
pyalf-requirements
pyalf-full
pyalf-doc
)

registry="git.physik.uni-wuerzburg.de:25812/alf/alf_docker"

for name in "${names[@]}"; do
    for directory in "$name"/*; do
        if [[ -d $directory ]]; then
            fullname="${directory}:$(date --iso-8601)"
            echo "====== building $fullname ======"
            docker build -t "$fullname" "$directory" || exit 1
            docker tag "$fullname" "$registry/$fullname" || exit 1
            docker push "$registry/$fullname" || exit 1
        fi
    done
done
