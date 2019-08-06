# Ekonomi (Backend)
This repository represents the backend service for the budgeting of your finances. This is a private project
to manage my own finances. I am happy to open source it for others to learn from but I do not provide any
spoort (at least at the moment).

## Development
This program uses libraries which require you to use the latest `nightly` build of rust. To do so, please
execute

```shell script
rustup override set nightly
rustup update
```

to install and activate the latest nightly version of Rust.

### Dockerized build
The project also provides a `Dockerfile` which can be used to build a local container without installing rust
on your server directly. Just run

```shell script
docker image build -t ekonomi:latest .
```

to build a new image and tag it with `ekonomi:latest`.