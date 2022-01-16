#!/bin/sh

project="angie"

error(){
	printf "\033[35mError:\t\033[31m${1}\033[0m\n"
	exit 1
}

printf "\033[33mLoading, bash complete code...\033[0m\n"
if [ -e "${project}" ];
then
	cp -a -v "${project}" /etc/bash_completion.d/ && \
	printf "\033[32mDone!\033[0m\n"
else
	error "Unable to find ${project}"
fi
