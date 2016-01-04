#!/bin/bash

CURRENT=$(pwd)
cd $(dirname $0)
export PATH="$(pwd)/bin:${PATH}"
cd ${CURRENT}


SCRIPTS=($(find ~/.bash_scripts -maxdepth 1 -mindepth 1 -not -type d))
for s in "${SCRIPTS[@]}"; do
	source $s
done
