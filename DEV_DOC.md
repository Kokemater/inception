Developer documentation This file must describe how a developer can:

### SETUP
To start the project, you will need the requirements specified in `README.md`.  
You need to add the secrets:
- `secrets/db_password.txt`
- `secrets/db_root_password.txt`
And run make.
Configurations for each service are located at srcs/requirements/, you can change the given ones or add new files configuration (but also adding them to the DockerFile)

### Build
We provide a Makefile. Running make will run the complete setup, if you want you can run it manually from the DockerCompose.yml

### Management
To manage containers and volumes, you can add them to the docker compose, or manage them with Docker commands such as: docker ps, docker stop {container_id}, docker rm {container_id}


### Project Data
Volumes are stored in ~/data, by default it is stored in jbutragu as shown in the makefile:
directories:
	@sudo mkdir -p /home/jbutragu/data/mariadb
	@sudo chown -R "101:101" /home/jbutragu/data/mariadb
	@sudo mkdir -p /home/jbutragu/data/wordpress
	@sudo chown -R  "101:101" /home/jbutragu/data/mariadb

  you must change this, to your own directory
