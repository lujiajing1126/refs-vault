#!/bin/bash

set -euo pipefail

usage() {
    echo "usage: getbib [doi url]"
    exit -1
}

[ $# -lt 1 ] && usage

# https://doi.org/10.1103/PhysRevC.49.2950
if [ -n $(command -v -- curl) ]; then
    curl -L -H 'Accept: application/x-bibtex; charset=utf-8' "$1"
else
    echo "curl is required"
    exit -1
fi