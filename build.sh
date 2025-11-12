#!/bin/bash
set -euo pipefail

push_images="${PUSH_IMAGES:-1}"
push_dockerhub="${PUSH_DOCKERHUB:-0}"
build_date="${BUILD_DATE:-$(date --iso-8601)}"

names=(
    base-imgs
    alf-requirements
    pyalf-requirements
    pyalf-full
    pyalf-doc
)

if [[ -n "${REGISTRY_URL:-}" ]]; then
    registry="${REGISTRY_URL}"
    echo "Using registry: ${registry}"
elif [[ -n "${GITHUB_REPOSITORY:-}" ]]; then
    # Default to the GitHub Container Registry for CI runs
    registry="ghcr.io/${GITHUB_REPOSITORY,,}"
    echo "Using registry: ${registry}"
else
    registry="git.physik.uni-wuerzburg.de:25812/alf/alf_docker"
    echo "Using default registry: ${registry}"
fi

for name in "${names[@]}"; do
    for directory in "$name"/*; do
        if [[ -d $directory ]]; then
            echo "====== building ${directory} ======"
            build_args=()
            if [[ -n "${registry:-}" ]]; then
                build_args+=(--pull --build-arg "REGISTRY_PREFIX=${registry}/")
            fi
            docker build "${build_args[@]}" -t "${directory}:latest" "$directory"
            docker tag "${directory}:latest" "${directory}:${build_date}"
            if [[ "${push_images}" == "1" ]]; then
                docker tag "${directory}:latest" "${registry}/${directory}:${build_date}"
                docker tag "${directory}:latest" "${registry}/${directory}:latest"
                docker push "${registry}/${directory}:${build_date}"
                docker push "${registry}/${directory}:latest"
            else
                echo "Skipping push for ${directory}"
            fi
        fi
    done
done


if [[ "${push_dockerhub}" == "1" && "${push_images}" == "1" ]]; then
    # Additionally tag and push the full Jupyter image to the official Docker Hub registry.
    docker tag "pyalf-full/jupyter:latest docker.io/alfcollaboration/jupyter-pyalf-full:${build_date}"
    docker tag "pyalf-full/jupyter:latest docker.io/alfcollaboration/jupyter-pyalf-full:latest"
    docker push "docker.io/alfcollaboration/jupyter-pyalf-full:${build_date}"
    docker push "docker.io/alfcollaboration/jupyter-pyalf-full:latest"
fi