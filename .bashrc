#!/bin/bash
CURRENT=$(pwd)
SCRIPTS=($(find ~/.bash_scripts -maxdepth 1 -mindepth 1 -not -type d))
for s in "${SCRIPTS[@]}"; do
	source $s
done

# On BBB, the $(dirname $0) doesn't work because $0 will be `-bash`.
# So, inspired by http://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
# The following function is used to form the correct path of `.bashrc`.
#
function get_current_path {
	pushd . > /dev/null
	local SCRIPT_PATH="${BASH_SOURCE[0]}";
	while([ -h "${SCRIPT_PATH}" ]); do
		cd "`dirname "${SCRIPT_PATH}"`"
		SCRIPT_PATH="$(readlink "`basename "${SCRIPT_PATH}"`")";
	done
	cd "`dirname "${SCRIPT_PATH}"`" > /dev/null
	SCRIPT_PATH="`pwd`";
	popd  > /dev/null
	echo ${SCRIPT_PATH}
}

# For embedded-linux, no need to calculate the version of nodejs
# every time, which will make SSH terminal response time longer.
#
function node_ver {
	[ "" != "$(which nodenv)" ] && echo "node@$(nodenv version | awk '{print $1}') "
}

DOTFILE_DIR="$(get_current_path)"
export PATH="${DOTFILE_DIR}/bin:${PATH}"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ "true" == "${USE_NODE_VERSION_CACHE}" ]; then
	VERSION="node@$(nodenv version  | awk '{print $1}') "
	export PS1="${VERSION}\[\e[00;32m\]\t\[\e[0m\]\[\e[00;37m\] \u@\h \[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\] [\[\e[0m\]\[\e[01;37m\]\$?\[\e[0m\]\[\e[00;37m\]]\n\[\e[0m\]\[\e[00;34m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
else
	export PS1="\$(node_ver)\[\e[00;32m\]\t\[\e[0m\]\[\e[00;37m\] \u@\h \[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\] [\[\e[0m\]\[\e[01;37m\]\$?\[\e[0m\]\[\e[00;37m\]]\n\[\e[0m\]\[\e[00;34m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
fi

[ "" != "${BASHRC_EXTRA}" ] && [ -f "${BASHRC_EXTRA}" ] && source ${BASHRC_EXTRA}
