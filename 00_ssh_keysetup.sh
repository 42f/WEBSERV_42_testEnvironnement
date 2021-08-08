#! /bin/bash

SSH_KEY=~/.ssh/webserv_testenv
SSH_PUBLIC_KEY=~/.ssh/webserv_testenv.pub

if [ -f "$SSH_KEY" -a -f "$SSH_PUBLIC_KEY" ]; then
	echo "ssh key is present."
else
	ssh-keygen -f $SSH_KEY
fi
