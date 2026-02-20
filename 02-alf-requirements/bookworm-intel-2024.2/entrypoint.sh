#!/bin/bash
set -e

# Source oneAPI environment
source /opt/intel/oneapi/setvars.sh

# Execute the container command
exec "$@"