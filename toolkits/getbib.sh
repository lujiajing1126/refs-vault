#!/bin/bash

set -euo pipefail

usage() {
    echo "usage: getbib [doi url]"
    exit -1
}

[ $# -lt 1 ] && usage

if [ -n $(command -v -- curl) ]; then
    if [[ "$1" == http* ]]; then
        # $1 = https://doi.org/10.1103/PhysRevC.49.2950
        curl -L -H 'Accept: application/x-bibtex; charset=utf-8' "$1"
    else
        # $1 = 10.1103/PhysRevC.49.2950
        curl -L -H 'Accept: application/x-bibtex; charset=utf-8' "https://doi.org/$1"
    fi
else
    echo "curl is required"
    exit -1
fi