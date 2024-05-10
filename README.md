
# Entorno de desarrollo con Docker, PHP, XDebug y Laravel
## Este proyecto ha sido realizado siguiendo los pasos de la web
https://medium.com/@murilolivorato/setting-up-a-laravel-development-environment-with-docker-and-docker-compose-a-step-by-step-5e37670ae640

## Basado en el proyecto de Github
https://github.com/murilolivorato/laravel_docker_enviroment

## Ejecutar los siguientes comandos para comenzar tu proyecto.
- docker-compose up -d --build
- docker-compose run --rm composer create-project laravel/laravel:8.* project_name
- docker-compose run --rm composer install
- docker-compose run --rm artisan key:generate