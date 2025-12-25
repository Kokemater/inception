This project has been created as part of the 42 curriculum by jbutragu.

# Inception

## Description

The **Inception** project introduces containerization and service orchestration using **Docker** and **Docker Compose**.  
The goal is to build a small infrastructure composed of multiple services running in isolated containers, while respecting strict security and design constraints.

The project simulates a real-world deployment scenario by configuring:
- An **NGINX** web server with TLS
- A **WordPress** application
- A **MariaDB** database

Each service runs in its own Docker container, connected through a dedicated Docker network, and persists data using Docker volumes.

This project emphasizes **system administration**, **networking**, **security**, and **DevOps best practices**.

---

## Project Architecture

The infrastructure consists of the following containers:

- **NGINX**
  - Acts as a reverse proxy
  - Handles HTTPS connections using TLS
- **WordPress**
  - PHP-FPM based WordPress application
- **MariaDB**
  - Relational database backend for WordPress

All services are orchestrated using **Docker Compose** and communicate through a private Docker network.

---

## Instructions

### Requirements

- Docker
- Docker Compose
- GNU Make (optional but recommended)

### Installation

Clone the repository:

```bash
git clone https://github.com/<login1>/inception.git
cd inception
