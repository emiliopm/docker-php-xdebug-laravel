
# Entorno de desarrollo con Docker, PHP, XDebug y Laravel
## Este proyecto ha sido realizado siguiendo los pasos de la web
https://medium.com/@murilolivorato/setting-up-a-laravel-development-environment-with-docker-and-docker-compose-a-step-by-step-5e37670ae640

## Basado en el proyecto de Github
https://github.com/murilolivorato/laravel_docker_enviroment

## Importante
Antes de comenzar, debes de poner tus usuarios y contraseñas en los ficheros:
- docker-compose.yaml
      - PMA_HOST=mysql
      - PMA_USER=root
      - PMA_PASSWORD=rootpassword
- mysql\.env
      - MYSQL_USER=mysqluser
      - MYSQL_PASSWORD=mysqlpassword
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_DATABASE=databasename
- src\.env
      - DB_CONNECTION=mysql
      - DB_HOST=127.0.0.1
      - DB_PORT=3306
      - DB_DATABASE=databasename
      - DB_USERNAME=mysqluser
      - DB_PASSWORD=mysqlpassword
## Ejecutar los siguientes comandos para tener el proyecto de Laravel funcionando con Docker
- docker-compose up -d --build


## Entramos en el proyecto con el navegador web
Ya podemos acceder a Laravel a través del puerto 8080

http://localhost:8080/

## Configuración acceso base de datos desde Laravel

Accedemos al fichero src\.env 
Y actualizamos los siguientes valores


## Otros comandos útiles

Comando para actualizar un proyecto ya existente.
docker-compose run --rm composer update

Comando para ejecutar las tareas programadas de Laravel
docker-compose run --rm artisan schedule:run

Comando para importar una copia de seguridad de mysql
mysql -u root -p databasename -v --ssl-mode=disabled < "backup.sql"