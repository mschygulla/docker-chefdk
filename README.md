# ChefDK

This is a Docker image providing [ChefDK](https://downloads.chef.io/chefdk).

The Chef development kit contains all the tools you need to develop and test your infrastructure, built by the awesome Chef community.

## Build

    make build test

## Usage

Executing chef-client:

    docker run --rm -ti -v $HOME/.chef:/etc/chef chefdk:3.1.0 chef-client

Executing knife:

    docker run --rm -ti -v $HOME/.chef:/root/.chef chefdk:3.1.0 knife status

## Where to Store Data

The default working directory of this container is ```/chef```.

1. Create a chef directory on a suitable volume on your host system, e.g. ```$HOME/chef```.
2. Start the ChefDK container like this:

    docker run --rm -ti -v $HOME/chef:/chef chefdk:3.1.0 chef generate cookbook httpd
    docker run --rm -ti -v $HOME/chef:/chef -w /chef/httpd chefdk:3.1.0 delivery local lint

The ```-v $HOME/chef:/chef``` part of the command mounts the ```$HOME/chef``` directory from the underlying host system as ```/chef``` inside the container, where ChefDK will write its data files.

## License

View [license information](https://downloads.chef.io/chefdk/stable/3.1.0/ubuntu/18.04/license) for the software contained in this image.
