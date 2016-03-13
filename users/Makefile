#all: *.conf

# First make the networks for the user
%.networks : %/networks
	$(MAKE) -C $*/networks

# Then make the devices (the devices makefile handles it if there)
%.devices : %/devices
	$(MAKE) -C $*/devices

# Then make the user config
%.conf : %.tpl %.networks %.devices
	cat $*.tpl $*.networks $*.devices > $*.conf
