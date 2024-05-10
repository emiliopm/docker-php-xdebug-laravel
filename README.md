
# Entorno de desarrollo con Docker, PHP, XDebug y Laravel
## Este proyecto ha sido realizado siguiendo los pasos de la web
https://medium.com/@murilolivorato/setting-up-a-laravel-development-environment-with-docker-and-docker-compose-a-step-by-step-5e37670ae640

## Basado en el proyecto de Github
https://github.com/murilolivorato/laravel_docker_enviroment

## Ejecutar los siguientes comandos para crear un nuevo proyecto
- docker-compose up -d --build
- docker-compose run --rm composer create-project laravel/laravel:8.* project_name

## Pasos de configuración del entorno
Una vez tenemos creado el proyecto, necesitamos que se encuentre en la carpeta SRC.

Por ello, debemos mover el proyecto que se encuentra en la carpeta "src\project_name" hacia la carpeta "src"

Una vez realizada esta tarea, ya podemos acceder a Laravel a través del puerto 8080

http://localhost:8080/



## Otros comandos útiles

Comando para actualizar un proyecto ya existente.
docker-compose run --rm composer update

Comando para ejecutar las tareas programadas de Laravel
docker-compose run --rm artisan schedule:run

Comando para importar una copia de seguridad de mysql
mysql -u root -p databasename -v --ssl-mode=disabled < "backup.sql"