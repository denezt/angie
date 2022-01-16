target_dir ?=/usr/bin
project=angie
srclib=lib
lib1=angielib.sh
lib2=yclib.sh
deps=$(lib1) $(lib2)
templ_dir=.litter

all: initialize install templates autocomplete

initialize:
	@printf "\033[35mStarting, setup process\033[0m\n"
	@apt-get -y update
	@apt-get -y install sudo
.PHONY:
templates:
	@printf "\033[33mLoading, templates...\033[0m\n"
	@./litter.sh

autocomplete:
	@printf "Adding, autocompletion functionality.\n"
	@cp -a -v bash_completion.d/angie /etc/bash_completion.d/ && printf "Done!\n"

install:
	$(foreach f, $(deps), cp -a -v $(srclib)/$(f) $(project) $(target_dir);)
	@chmod +x $(target_dir)/$(project)

uninstall:
	@printf "\033[35mRemoving, \033[33m$(lib1)\033[0m\n"
	@find $(target_dir) -type f -name "$(lib1)" -delete
	@printf "\033[35mRemoving, \033[33m$(lib2)\033[0m\n"
	@find $(target_dir) -type f -name "$(lib2)" -delete
	@printf "\033[35mRemoving, \033[33m$(project)\033[0m\n"
	@find $(target_dir) -type f -name "$(project)" -delete

reinstall: uninstall install
	@printf "\033[35mReinstalled Program \033[32m$(project)\033[0m\n"

clean_litter:
	@find $(HOME)/$(templ_dir) -type f -delete && printf "\033[31mRemoved, all templates.\033[0m\n" || \
		printf "\033[35mNo templates were found.\033[0m\n"
