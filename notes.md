Containers are just a process (or a group of processes) running in isolation, which is achieved with Linux namespaces and control groups. Linux namespaces and control groups are features that are built into the Linux kernel. Other than the Linux kernel itself, there is nothing special about containers.
## LAB 1 Run your First Container 
---
1. **docker container run -t ubuntu top**
   - *command to run a container with the Ubuntu image by using the top command*
   - The -t flag allocates a pseudo-TTY, which you need for the top command to work correctly.
   - The docker run command first starts a docker pull to download the Ubuntu image onto your host. After downloaded, it will start the container.

*Notes:
Containers use Linux namespaces to provide isolation of system resources from other containers or the host. The PID namespace provides isolation for process IDs. If you run top while inside the container, you will notice that it shows the processes within the PID namespace of the container, which is much different than what you can see if you ran top on the host.*

2. **docker container exec** /  **docker exec -it container-name /bin/bash**
   - *command allows you to enter a running container's namespaces with a new process*
   - Using docker container exec with bash is a common way to inspect a Docker container.

*Notes:
List of Linux namespaces that provides containers with isolation to system resources include:*
+ PID: 
+ MNT: *Mount and unmount directories without affecting other namespaces.*
+ NET: *Containers have their own network stack.*
+ IPC: *Isolated interprocess communication mechanisms such as message queues.*
+ User: *Isolated view of users on the system.*
+ UTC: *Set hostname and domain name per container.*

1. **docker container run --detach --publish 8080:80 --name nginx nginx**
   - --detach flag will run this container in the background.
   - --publish flag publishes port 80 in the container (the default port for NGINX) by using port 8080 on your host
   - Note: NET namespace gives processes of the container their own network stack.
   - --name flag, which names the container.
2. **docker ps** / **docker container ls**
   - *get list of running containers.*   
3. **docker stop container-name/container-id**
   - *Stop the containers*
4. **docker system prune**
   - *Removes any stopped containers, unused volumes and networks, and dangling images*

## LAB 2 Add Ci/CD value with Docker Images
---
1. Dockerfile
    - A Dockerfile lists the instructions needed to build a Docker image

*Note: It is best practice to use a specific tag when inheriting a parent image so that changes to the parent dependency are controlled*

2. **docker build -t my-python-app .**
   - Build the Docker image. Pass in the -t parameter to name your image.

3. **docker run -p 5001:5000 -d my-python-app**
   - -p flag maps a port running inside the container to your host

4. **docker logs container-name/container-id**
   - Check the log output of the container.
   - prints out what is sent to standard out by your application

5. **docker tag my-python-app [dockerhub username]/my-python-app**
   - Tag the image with your username.
  
6. **docker push [dockerhub username]/my-python-app**
   - use this command to push your image to the Docker Hub registry

Notes on Deploying Changes:
Once you have made a changes, you need to rebuild your app and push it to Docker Hub registery.


*Notes:
Docker images contain all the dependencies that they need to run an application within the image. This is useful because you no longer need to worry about environment drift (version differences) when you rely on dependencies that are installed on every environment you deploy to.*
   
Notes:
The Dockerfile is used to create reproducible builds for your application. A common workflow is to have your CI/CD automation run docker image build as part of its build process. After images are built, they will be sent to a central registry where they can be accessed by all environments (such as a test environment) that need to run instances of that application.

   - 
### **Reference**
---
[Dockerfile info](https://docs.docker.com/engine/reference/builder/)
