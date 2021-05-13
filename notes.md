Containers are just a process (or a group of processes) running in isolation, which is achieved with Linux namespaces and control groups. Linux namespaces and control groups are features that are built into the Linux kernel. Other than the Linux kernel itself, there is nothing special about containers.

1. **docker container run -t ubuntu top**
   - *command to run a container with the Ubuntu image by using the top command*
   - The -t flag allocates a pseudo-TTY, which you need for the top command to work correctly.
   - The docker run command first starts a docker pull to download the Ubuntu image onto your host. After downloaded, it will start the container.

Note:
Containers use Linux namespaces to provide isolation of system resources from other containers or the host. The PID namespace provides isolation for process IDs. If you run top while inside the container, you will notice that it shows the processes within the PID namespace of the container, which is much different than what you can see if you ran top on the host.

2. **docker container exec** /  **docker exec -it container-name /bin/bash**
   - *command allows you to enter a running container's namespaces with a new process*
   - Using docker container exec with bash is a common way to inspect a Docker container.

Note:
List of Linux namespaces that provides containers with isolation to system resources include:
PID: 
MNT: Mount and unmount directories without affecting other namespaces.
NET: Containers have their own network stack.
IPC: Isolated interprocess communication mechanisms such as message queues.
User: Isolated view of users on the system.
UTC: Set hostname and domain name per container.

3. **docker container run --detach --publish 8080:80 --name nginx nginx**
   - --detach flag will run this container in the background.
   - --publish flag publishes port 80 in the container (the default port for NGINX) by using port 8080 on your host
   - Note: NET namespace gives processes of the container their own network stack.
   - --name flag, which names the container.
4. **docker ps** / **docker container ls**
   - *get list of running containers.*

