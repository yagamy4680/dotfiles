#!/bin/bash

CURRENT=$(pwd)
cd $(dirname $0)
export PATH="$(pwd)/bin:${PATH}"
cd ${CURRENT}

SCRIPTS=($(find ~/.bash_scripts -maxdepth 1 -mindepth 1 -not -type d))
for s in "${SCRIPTS[@]}"; do
	source $s
done

function node_ver {
[ "" != "$(which nodenv)" ] && echo "node@$(nodenv version | awk '{print $1}') "
}

export PS1="\$(node_ver)\[\e[00;32m\]\t\[\e[0m\]\[\e[00;37m\] \u@\h \[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\] [\[\e[0m\]\[\e[01;37m\]\$?\[\e[0m\]\[\e[00;37m\]]\n\[\e[0m\]\[\e[00;36m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
