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
            echo "====== building ${directory} ======"
            docker build -t "${directory}:latest" "$directory" || exit 1
            docker tag "${directory}:latest" "${directory}:$(date --iso-8601)" || exit 1
            docker tag "${directory}:latest" "$registry/${directory}:$(date --iso-8601)" || exit 1
            docker tag "${directory}:latest" "$registry/${directory}:latest" || exit 1
            docker push "$registry/${directory}:$(date --iso-8601)" || exit 1
            docker push "$registry/${directory}:latest" || exit 1
        fi
    done
done
