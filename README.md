# PFC - Sensación

## Descripción:

Este primer directorio servirá de estructura y documentación. También incluirá los manifiestos de kubernetes e instrucciones para el despliegue de la aplicación. Quizá también incluyo aquí el compose.yml para desarrollo.

Incluirá otros módulos que se gestionarán con git (git submodule).

## Estructura y documentación:

- kube
- server
- front

### Módulos que incluye:

- [server](https://github.com/kennycallado/PFC-server)
- [front](https://github.com/kennycallado/PFC-front)

### Instrucciones:

Para clonar el proyecto con los submódulos:

``` bash
git clone --recourse-submodules
```

OJO:

Para actualizar el HEAD de los submódulos:

``` bash
git add .
git commit "UPDATE
Actualiza puntero HDEAD de submodulos"
```
