*Este proyecto ha sido creado como parte del currículo de 42 por jbutragu.*

# Inception

## Descripción

**Inception** es un proyecto cuyo objetivo principal es aprender a usar **Docker** para crear y gestionar varios servicios que funcionan juntos, pero de forma **aislada**.  
La idea es simular cómo se despliega una aplicación real en un servidor, usando contenedores en lugar de instalar todo directamente en el sistema.

En este proyecto se construye una pequeña infraestructura compuesta por:
- Un servidor web (**NGINX**) que recibe las peticiones del navegador
- Una página web hecha con **WordPress**
- Una base de datos **MariaDB**, donde WordPress guarda la información

Cada uno de estos servicios se ejecuta en su **propio contenedor**, lo que significa que están separados entre sí y no interfieren con el sistema principal.

Este proyecto está pensado para principiantes y sirve para entender:
- Qué es Docker y para qué sirve
- Cómo se comunican varios servicios entre sí
- Cómo mantener una aplicación organizada, segura y fácil de mantener

---

## ¿Qué es Docker y por qué se usa?

Docker es una herramienta que permite ejecutar programas dentro de **contenedores**.  
Un contenedor es como una “mini-computadora” que contiene solo lo necesario para que un programa funcione.

Las ventajas principales de Docker son:
- Todo funciona igual en cualquier ordenador
- Los servicios están aislados y no se rompen entre sí
- Es fácil iniciar, parar o reconstruir todo el proyecto

---

## Arquitectura del Proyecto (explicada de forma simple)

El proyecto tiene **tres contenedores**, cada uno con una función clara:

- **NGINX**
  - Es el punto de entrada
  - Recibe las peticiones del navegador
  - Usa HTTPS (TLS) para que la conexión sea segura

- **WordPress**
  - Es la página web que ve el usuario
  - Se ejecuta con PHP-FPM
  - Se conecta a la base de datos para guardar información

- **MariaDB**
  - Guarda los datos de WordPress
  - No es accesible desde fuera, solo desde WordPress

Todos los contenedores están conectados a una **red privada de Docker**, de forma que solo pueden comunicarse entre ellos.

---

## Instrucciones

### Requisitos

Para poder ejecutar el proyecto necesitas:
- Docker
- Docker Compose
- Make (opcional, pero facilita los comandos)

### Instalación

Clona el repositorio y entra en la carpeta:

```bash
git clone https://github.com/jbutragu/inception.git
cd inception
