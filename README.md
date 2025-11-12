# ALF Docker containers

This repository hosts the Dockerfiles used to build the ALF container images. The `build.sh` script can be invoked locally or in CI to build every image defined in the tree and push them to the configured registries.

## GitHub Actions pipeline

- The workflow at `.github/workflows/docker-build.yml` builds every image on pushes to `main`, pull requests, or manual triggers.
- A job matrix spins up parallel runners for the distributions (`archlinux`, `bookworm`, `bullseye`, `jupyter`, `trixie`, `tumbleweed`), each invoking the build script with `SELECT_DISTRIBUTION` set accordingly.
- Images are published to the GitHub Container Registry namespace `ghcr.io/<owner>/<repository>/...` when the workflow runs on the default branch or via manual dispatch.
- The workflow relies on the built-in `GITHUB_TOKEN` and requests the `packages: write` permission; no additional secrets are required.
- Pull request runs build the images for validation but skip the push step by propagating `PUSH_IMAGES=0` to the build script.

## Local usage

Run `./build.sh` to build all images. Set `SELECT_DISTRIBUTION=<name>` (with `<name>` one of `archlinux`, `bookworm`, `bullseye`, `jupyter`, `trixie`, `tumbleweed`) to restrict the build to a single distribution. Set `REGISTRY_URL` to push to a custom registry and export `PUSH_IMAGES=0` for a dry run without pushing.

