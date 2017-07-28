# docker-php-fpm-magento2

## What is this?

This repository contains Dockerfile and configuration for creating a Docker
image suitable for Magento 2 in Docker Swarm Mode.

The Docker image uses the following Docker image:

* **php:7.0-fpm-alpine**: [Docker Hub](https://hub.docker.com/_/php/),
[Dockerfile / repo](https://github.com/docker-library/php/blob/ddc7084c8a78ea12f0cfdceff7d03c5a530b787e/7.0/fpm/alpine/Dockerfile)

... which means that the container uses:

1. Alpine Linux distro (lightweight)
1. PHP FastCGI Process Manager (PHP-FPM)

It keeps to Docker's principle that 
*"[Each container should have only one concern](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#each-container-should-have-only-one-concern)"*, so it does not serve HTTP, 
database, Redis, Varnish or any other service. 

You should start a different container for that.

## This image is highly likely not ready for production

I am experimenting with CoreOS, Docker Swarm, automatic horizontal scaling and 
improved continous integration and I don't - at this stage - have an optimal
setup.

Feel free to create an issue if you have anything to contribute.

## License

[MIT](https://opensource.org/licenses/MIT). See [LICENSE.md](LICENSE.md).