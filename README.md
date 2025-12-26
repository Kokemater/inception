*This project has been created as part of the 42 curriculum by jbutragu*

# Inception

## Description

**Inception** is a project focused on building a web infrastructure using **Docker** and **Docker Compose**, with the goal of understanding how applications are deployed in a modular, reproducible, and secure way.

The project consists of bringing up several independent services that cooperate with each other, each one running in its own container. This separation allows responsibilities to be isolated, improves security, and facilitates maintenance.

The infrastructure is composed of:
- **NGINX**, as a web server with TLS
- **WordPress**, as a dynamic web application
- **MariaDB**, as the database management system

---

## Project Architecture

The architecture follows a microservices model:

- **NGINX**
  - Entry point to the infrastructure
  - Handles HTTPS connections
  - Redirects requests to the WordPress container

- **WordPress**
  - Executes the web application logic
  - Communicates with the database to store content

- **MariaDB**
  - Stores persistent data
  - Only accessible from Docker’s internal network

All services are connected through a **private Docker Network**, avoiding unnecessary exposure to the outside.

---

## Instructions

### Requirements

- Docker
- Docker Compose
- Make

### Installation

bash:
git clone https://github.com/jbutragu/inception.git
cd inception
make

## Resources

The resources used for this project include the official documentation of WordPress, MariaDB, Nginx, Docker, and a tutorial on deploying a LEMP stack with Docker. Specifically:

- **WordPress Documentation**: https://wordpress.org/documentation/  
- **MariaDB Documentation**: https://mariadb.com/docs  
- **Nginx Beginner’s Guide**: https://nginx.org/en/docs/beginners_guide.html  
- **Docker Get Started Guide**: https://docs.docker.com/get-started/introduction/  
- **LEMP Stack on Docker Tutorial**: https://www.hostmycode.in/tutorials/lemp-stack-on-docker  

Additionally, **ChatGPT** (https://chatgpt.com/) was used to clarify concepts and provide explanations when needed.


## Project Description, Use of Docker, and Design Decisions

### Use of Docker in the Project

In this project, **Docker** is used to create a modular infrastructure in which each service runs in an independent container. This allows responsibilities to be isolated, improves security, and simplifies both deployment and maintenance.

Docker is responsible for:
- Creating reproducible environments
- Isolating dependencies between services

The composition of all containers is handled through **Docker Compose**, which defines:
- Services
- Networks
- Volumes
- Required environment variables

---

### Sources Included in the Project

The project includes only files specifically created for this infrastructure, without using preconfigured external images (except official base images, such as Alpine).

The included sources are:
- One `Dockerfile` per service (NGINX, WordPress, and MariaDB)
- A `docker-compose.yml` file for composition
- Custom configuration files:
  - NGINX configuration
  - WordPress initialization scripts
  - MariaDB initialization scripts

---

## Comparison of Technical Decisions

### Virtual Machines vs Docker

**Virtual Machines**:
- Run a full operating system
- Higher CPU, memory, and storage consumption
- Slow startup

**Docker**:
- Shares the host system’s kernel
- Lighter and faster
- Ideal for service-based architectures

Docker is chosen for its efficiency, speed, and suitability for deployment environments.

---

### Secrets vs Environment Variables

**Environment Variables**:
- Simple to configure
- Suitable for educational projects and controlled environments

**Secrets**:
- Designed to protect sensitive information
- More secure in production

In this project, **environment variables** are used, stored in `.env` files, and **Secrets** are also used, saved in a secrets directory that has not been uploaded to the repository, following the subject’s guidelines.

---

### Docker Network vs Host Network

**Host Network**:
- The container directly shares the host system’s network
- Less isolation and higher risk of port conflicts

**Docker Network**:
- Isolated virtual network
- Controlled communication between containers
- Improved security

The project uses a **private Docker Network** to isolate services from the host and from each other.

---

### Docker Volumes vs Bind Mounts

**Bind Mounts**:
- Use host system paths
- Dependent on host directory structure
- Can cause permission issues

**Docker Volumes**:
- Managed by Docker
- More portable and secure
- Recommended for production

**Docker Volumes** are used to ensure persistence of WordPress and MariaDB data, even after restarting or rebuilding the containers.


