<p align="center">
  <a href="https://profile.intra.42.fr/users/bvalette" rel="noopener">
 <img width=200px src="./assets/head.png" alt="Project logo"></a><br/><br/>
</p>


<h3 align="center">Webserv: test environnement</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![License](https://img.shields.io/badge/license-GPL-lightgrey)](/LICENSE)

</div>

---

<p align="center">
 <img width=200px src="./assets/docker.png" alt="Project logo"></a><br/>
  <h3>This project is a test environnement I created while completing the  project at École 42.</h3>
</p>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)

## 🧐 About <a name = "about"></a>

<p align="center">
  <a href="" rel="noopener"></a>
</p>

This repo contains a Dockerfile used to easily deploy a container running nginx server on a alpine linux and a ssh server to access it more conveniently than the docker attach command.
For simplicity, files for nginx config AND website example are all in `./volume`.
It is by no means a server setting you would use in any kind of production scenario.

## 🏁 Getting Started <a name = "getting_started"></a>

- Make sure the docker engine is set up and running on your machine.
- In order to use the ssh connection with the container, make sure you run the `00_ssh_keysetup.sh` in order to generate a ssh key in your ~/.ssh dedicated to this container.

## 👩‍💻 Usage <a name = "usage"></a>

- `make` will setup some test files permission, setup a symblink to the ssh public key, and build the docker image from the Dockerfile.
- `make start` will start the container as detached
- `make stop` will kill the running container
- `make re` will stop and start again.
- `make f` will build if necessary, run the container and attach to the container using docker attach command.

- To use the ssh connection, simply run `ssh root@localhost`, make sure you have run `./00_ssh_keysetup.sh` before. You may also setup your `~/.ssh/config` with a server name along the lines of:

```
[...]
Host docker
    HostName localhost
    user root
    Port 22
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/webserv_testenv
    IdentitiesOnly=yes
[...]
```

If `ssh root@localhost` asks for a password, it means you did not run the `./00_ssh_keysetup.sh` script.
