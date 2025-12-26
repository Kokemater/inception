## Understand what services are provided by the stack

### Services provided by the stack
Nginx as the web server, MariaDB as the database, and WordPress as the content management system.

### Usage
To start the project, you will need the requirements specified in `README.md`.  
Run `make` to complete the setup.  
To stop the project, use `make down`.

Also, remap `jbutragu.42.fr` to `localhost` to test the project locally.

### Admin
To access the website, open:  
https://jbutragu.42.fr

To access the admin panel, open:  
https://jbutragu.42.fr/wp-admin.php  
(after you have set up the website).

### Credentials
Usernames are stored in the `.env` file, and passwords are loaded from:
- `secrets/db_password.txt`
- `secrets/db_root_password.txt`

These files are not included in this repository; you must create them manually.

### Check
If you can open https://jbutragu.42.fr and the logs do not show any errors, then the project is working correctly.
