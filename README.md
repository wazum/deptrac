# deptrac Docker container

A small Alpine-based container with the [deptrac](https://github.com/sensiolabs-de/deptrac
) phar executable to run deptrac for example in a gitlab CI pipeline.

As you probably won't benefit from the graphical diagrams in a pipeline Graphviz is not included!

## Usage standalone

```
docker run --rm -v $PWD:/app wazum/deptrac <command>
```

will mount the current directory (where your source code is) as `/app` and run `analyze` in it.

```
docker run --rm -v $PWD:/app wazum/deptrac init
```

will mount the current directory as `/app` and create the default `depfile.yaml` in it.

## Usage with docker-compose

Add the container to your setup in docker-compose.yml
```
services:
  deptrac:
    container_name: my_deptrac
    image: wazum/deptrac
    networks:
      - my_network
    volumes:
      - ./app/:/app/
```

and run `analyze` with:

```
docker-compose run --rm deptrac analyze
```

## Build

You can set `DEPTRAC_VERSION` as build argument to use another (probably newer) version:

```
docker build -t <tag> --build-arg DEPTRAC_VERSION=0.8.x .
```

