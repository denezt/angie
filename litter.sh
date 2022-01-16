#!/bin/bash
#
#

src_dir='examples'
target_dir="$HOME/.litter"

error(){
	printf "\033[35mError:\t\033[35m${1}\033[0m\n"
	exit 1
}

printf "\033[33mBuilding, ${target_dir}\033[0m\n"
if [ ! -d "${target_dir}" ];
then
	mkdir -v "${target_dir}"
fi

if [ -d "${src_dir}" -a -d "${target_dir}" ];
then
	__template=($(find "${src_dir}" -type f))
	for f in ${__template[@]}
	do
		cp -a -v "${f}" "${target_dir}" && \
		printf "\033[35mTemplate \033[32m${f} \033[35mwas successfully stored to \033[32m${target_dir}\033[0m.\n"
	done
else
	error "Unable to find ${src_dir} or ${target_dir}"
fi
