
all:
	./00_build.sh

start: all
	./01_start.sh

stop:
	./02_kill.sh

attach:
	./01_attach.sh

f: re attach

re: stop
	./01_start.sh

.phony: all
