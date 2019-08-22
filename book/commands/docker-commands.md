# Docker

## Notes

**Docker** is a shipping container system for code. It acts as an engine that enables any payload to be encapsulated as a lightweight, portable self-sufficient container.

When docker builds images it does so in its own daemon. However, when we want to run things locally inside our VM (Minikube) we need to specify the daemon to use.

### Dockerfile

The Dockerfile contains all the instructions required to build a given image. They should be as ephemeral as possible.

The .dockerignore file should be used to ignore all files that are not used to build the image so as to improve the performance of the build.

Wherever possible sort multi-line arguments alphanumerically to avoid duplication of packages and to make easier to update. To create a new line between arguments use the backspace, \, character.

For each instruction in the Dockerfile, Docker will look for an existing image it can use in the cache, rather than creating a duplicate image. To not use this, implement —no-cache=true option on the docker build command.

Docker-Compose

- link and depends_on differ in that order to start up and whether ports are automatically assigned.

#### Dockerfile Syntax

```Dockerfile
FROM <image>[:<tag>] [AS <name>]
```

All Dockerfile's must start this instruction. The FROM instruction initialises a new build stage and sets the Base Image for subsequent instructions. It can appear several times to create multiple images or use one build stage as a dependency for another.

```Dockerfile
COPY
```

The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.

COPY is preferred to ADD because it is more transparent. It only supports copying of local files into the container, unlike ADD which supports some more capabilities.

```Dockerfile
LABEL
RUN
```

The RUN instruction will execute any commands in a new layer on top of the current image and commit the results.

The most common usage of run is the `RUN apt-get` use-case, which installs packages.

```Dockerfile
CMD
```

Labels help organise images by project.

Docker hub is Docker's reposiroty for docker images.

```Dockerfile
VOLUME ["/data"]
```

The `VOLUME` instruction creates a mount point with the specified name.

```Dockerfile
EXPOSE <port_number>
```

```Dockerfile
ENTRYPOINT
```

### Docker Compose

**Docker Compose** is a tool for defining and running multi-container Docker applications. 

* `docker-compose up -d`

## Commands

### Fundamental Commands

* docker build -t <proposed_name> <path_to_image>

  * -t Give a shortened name to the image.

Build the docker image with Kubernetes.

* docker run --rm -p 3000:3000 devcamp/hello-world
  - —rm : remove the container after it has completed.
  - -p : explicitely map a single port or range of ports
  - -t : allocate a pseudo-tty
  - —pri : privileged. Give extended privileges to this container.

  - When building docker images:
    eval $(minikube docker-env)
    This tells Docker that it should talk to the Minikube Docker daemon instead of the local daemon.
  - docker images
  - make -f <makefile_name>

### Remove docker container and images

```
docker ps                                   // This lists all of the docker containers.

docker container stop <container_name>      // Stops the specified container (so that it can be deleted).

docker rm $(docker ps -aq)                  // This removes all docker containers

gradle createDocker                         // Can be run from master, and only needed if the image has been deleted

gradle initDocker                           // Again from master. For reference this task is in docker.gradle in the Deployment project
```

* Delete docker images/ containers.

```
docker rmi # delete a docker image
docker rm $(docker ps -a -q) # delete all the docker containers
```

# Docker build

* `docker build -t eigentech/section_pipeline:test -f docker_deployment/Dockerfile .`

### i2 Docker Commands

* `docker exec --user db2inst1 -t -i db2 /bin/bash -i`

Use this to get into the docker instance of db2 on mac.

## Moving Docker Images

### Docker Hub

* `docker push eigentech/section_pipeline:tagname` : push an image 

### Moving Locally

```
docker save -o <dest_path.tar> <image name> # Save a local images as a tar file

scp -i <path_to_key> foobar.txt your_username@remotehost.edu:/some/remote/directory
# ubuntu@10.11.97.174

docker load -i <path to image tar file> # 
```

## docker-compose

* To set performance limits for the docker images.

```
deploy:
    resources: 
	    limits:
		    memory: 32G
```

