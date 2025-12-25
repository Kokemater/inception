Este proyecto ha sido creado como parte del currículo de 42 por jbutragu.

# Inception

## Descripción

**Inception** es un proyecto centrado en la creación de una infraestructura web básica utilizando **Docker** y **Docker Compose**, con el objetivo de comprender cómo se despliegan aplicaciones modernas de forma modular, reproducible y segura.

El proyecto consiste en levantar varios servicios independientes que cooperan entre sí, cada uno ejecutándose en su propio contenedor. Esta separación permite aislar responsabilidades, mejorar la seguridad y facilitar el mantenimiento.

La infraestructura está compuesta por:
- **NGINX**, como servidor web y reverse proxy con TLS
- **WordPress**, como aplicación web dinámica
- **MariaDB**, como sistema gestor de bases de datos

El enfoque del proyecto es práctico y está orientado a adquirir bases sólidas en **DevOps**, **administración de sistemas** y **redes**.

---

## Arquitectura del Proyecto

La arquitectura sigue un modelo de microservicios simple:

- **NGINX**
  - Punto de entrada a la infraestructura
  - Maneja las conexiones HTTPS
  - Redirige las peticiones al contenedor de WordPress

- **WordPress**
  - Ejecuta la lógica de la aplicación web
  - Se comunica con la base de datos para almacenar contenido

- **MariaDB**
  - Almacena los datos persistentes
  - Solo es accesible desde la red interna de Docker

Todos los servicios están conectados mediante una **Docker Network privada**, evitando exposiciones innecesarias al exterior.

---

## Instrucciones

### Requisitos

- Docker
- Docker Compose
- Make

### Instalación

git clone .
cd inception/
make




## Descripción del Proyecto, Uso de Docker y Decisiones de Diseño

### Uso de Docker en el Proyecto

En este proyecto se utiliza **Docker** para crear una infraestructura modular en la que cada servicio se ejecuta en un contenedor independiente. Esto permite aislar responsabilidades, mejorar la seguridad y facilitar tanto el despliegue como el mantenimiento.

Docker se encarga de:
- Crear entornos reproducibles
- Aislar dependencias entre servicios
- Facilitar la gestión del ciclo de vida de los servicios (build, start, stop, restart)

La orquestación de todos los contenedores se realiza mediante **Docker Compose**, que define de forma declarativa:
- Los servicios
- Las redes
- Los volúmenes
- Las variables de entorno necesarias

---

### Fuentes Incluidas en el Proyecto

El proyecto incluye únicamente archivos creados específicamente para esta infraestructura, sin usar imágenes preconfiguradas externas (excepto imágenes base oficiales).

Las fuentes incluidas son:
- Un `Dockerfile` por cada servicio (NGINX, WordPress y MariaDB)
- Un archivo `docker-compose.yml` para la orquestación
- Archivos de configuración personalizados:
  - Configuración de NGINX
  - Scripts de inicialización de WordPress
  - Scripts de inicialización de MariaDB

Solo se utilizan **imágenes base oficiales** (Debian o Alpine), garantizando transparencia y control total sobre el entorno.

---

## Comparación de Decisiones Técnicas

### Virtual Machines vs Docker

**Máquinas Virtuales**:
- Ejecutan un sistema operativo completo
- Mayor consumo de CPU, memoria y almacenamiento
- Arranque lento

**Docker**:
- Comparte el kernel del sistema host
- Más ligero y rápido
- Ideal para arquitecturas basadas en servicios

Docker se elige por su eficiencia, rapidez y adecuación a entornos modernos de despliegue.

---

### Secrets vs Variables de Entorno

**Variables de Entorno**:
- Simples de configurar
- Adecuadas para proyectos educativos y entornos controlados

**Secrets**:
- Diseñados para proteger información sensible
- Más seguros en producción

En este proyecto se utilizan **variables de entorno**, almacenadas en archivos `.env` que no se incluyen en el repositorio, siguiendo las indicaciones del enunciado.

---

### Docker Network vs Host Network

**Host Network**:
- El contenedor comparte directamente la red del sistema host
- Menor aislamiento y mayor riesgo de conflictos de puertos

**Docker Network**:
- Red virtual aislada
- Comunicación controlada entre contenedores
- Mayor seguridad

El proyecto utiliza una **Docker Network privada** para aislar los servicios del host y entre sí.

---

### Docker Volumes vs Bind Mounts

**Bind Mounts**:
- Usan rutas del sistema host
- Dependientes de la estructura del sistema
- Pueden causar problemas de permisos

**Docker Volumes**:
- Gestionados por Docker
- Más portables y seguros
- Recomendados para producción

Se utilizan **Docker Volumes** para asegurar la persistencia de los datos de WordPress y MariaDB, incluso tras reiniciar o reconstruir los contenedores.

git clone https://github.com/jbutragu/inception.git
cd inception
