# docker_airdcpp <a href='https://github.com/padhi-homelab/docker_airdcpp/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/actions/workflow/status/padhi-homelab/docker_airdcpp/docker-release.yml?branch=main&logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://hub.docker.com/r/padhihomelab/airdcpp'><img src='https://img.shields.io/docker/image-size/padhihomelab/airdcpp/latest?label=size%20%5Blatest%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/airdcpp'><img src='https://img.shields.io/docker/image-size/padhihomelab/airdcpp/testing?label=size%20%5Btesting%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>

A multiarch [AirDC++] Docker image, based on [Alpine Linux].

|        386         |       amd64        |          arm/v6          |       arm/v7       |       arm64        |         ppc64le          |          s390x           |
| :----------------: | :----------------: | :----------------------: | :----------------: | :----------------: | :----------------------: | :----------------------: |
| :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: |


## Usage

```
docker run --detach \
           -p 5600:5600 \
           -it padhihomelab/airdcpp
```

Serves AirDC++ web UI on port 5600.

Default web user is `user` and password is `pass`.

_<More details to be added soon>_


[Alpine Linux]: https://alpinelinux.org/
[AirDC++]:      https://airdcpp.net/
