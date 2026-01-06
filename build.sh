#!/bin/bash
set -euo pipefail

push_images="${PUSH_IMAGES:-1}"
push_dockerhub="${PUSH_DOCKERHUB:-0}"
build_date="${BUILD_DATE:-$(date --iso-8601)}"
# build_dirs=${BUILD_DIRS:-""}
build_dirs=()
mapfile -t build_dirs < <(find . -name Dockerfile | sed 's|/Dockerfile||' | sort)

# echo "${build_dirs[*]}"

if [[ -n "${BUILD_DIRS:-}" ]]; then
    echo "Overriding build directories from BUILD_DIRS environment variable."
    IFS=',' read -r -a build_dirs <<< "${BUILD_DIRS}"
fi

if [[ -n "${REGISTRY_URL:-}" ]]; then
    registry="${REGISTRY_URL,,}"
    echo "Using registry: ${registry}"
elif [[ -n "${GITHUB_REPOSITORY:-}" ]]; then
    # Default to the GitHub Container Registry for CI runs
    registry="ghcr.io/${GITHUB_REPOSITORY,,}"
    echo "Using registry: ${registry}"
else
    registry="git.physik.uni-wuerzburg.de:25812/alf/alf_docker"
    echo "Using default registry: ${registry}"
fi

if [[ -n "${build_dirs}" ]]; then
    IFS=',' read -r -a names <<< "${build_dirs}"
    echo "Building only specified directories: ${names[*]}"
fi

for build_dir in "${build_dirs[@]}"; do
    name="${build_dir:5}"
    echo "====== building ${name} ======"
    build_args=()
    if [[ -n "${registry:-}" ]]; then
        build_args+=(--pull --build-arg "REGISTRY_PREFIX=${registry}/")
    fi
    docker build "${build_args[@]}" -t "${name}:latest" "$build_dir"
    docker tag "${name}:latest" "${name}:${build_date}"
    if [[ "${push_images}" == "1" ]]; then
        docker tag "${name}:latest" "${registry}/${name}:${build_date}"
        docker tag "${name}:latest" "${registry}/${name}:latest"
        docker push "${registry}/${name}:${build_date}"
        docker push "${registry}/${name}:latest"
        if [[ "${push_dockerhub}" == "1" && "${name}" == "pyalf-full/jupyter" ]]; then
            # Additionally tag and push the full Jupyter image to the official Docker Hub registry.
            docker tag "pyalf-full/jupyter:latest" "docker.io/alfcollaboration/jupyter-pyalf-full:${build_date}"
            docker tag "pyalf-full/jupyter:latest" "docker.io/alfcollaboration/jupyter-pyalf-full:latest"
            docker push "docker.io/alfcollaboration/jupyter-pyalf-full:${build_date}"
            docker push "docker.io/alfcollaboration/jupyter-pyalf-full:latest"
        fi
    else
        echo "Skipping push for ${name}"
    fi
done

