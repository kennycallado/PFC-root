# PFC - Sensación

## Descripción:

El componente raíz del proyecto tiene dos funcionalidades. Una es contener la documentación relacionada con el proyecto, así como describir el proceso de despliegue de la aplicación a través de los manifiestos de kubernetes. Y por otro lado sirve para mantener las referencias a los commit concretos de cada submodulo. Esto quiere decir, que al haber implementado git submodule, cada vez que uno de los submodulos se actualiza no afecta directamente al proyecto, sino que desde la raíz deberá actualizarse la referencia de cada submodulo directamente. Esto permite actualizar, testear la aplicación y se algo no funciona volver a apuntar a un commit anterior hasta que se repare el error y se pueda volver a actualizar testear y finalmente desplegar.

## Estructura:

- front
- kube
- memoria
- server

### Módulos que incluye:

- [server](https://github.com/kennycallado/PFC-server)
- [front](https://github.com/kennycallado/PFC-front)

### Instrucciones:

Para clonar el proyecto con los submódulos:

``` bash
git clone --recourse-submodules
```

En cada módulo seguir las instrucciones del README para compilar y ejecutar el componente.

<!-- OJO: -->

<!-- Para actualizar el HEAD de los submódulos: -->

<!-- ``` bash -->
<!-- git add . -->
<!-- git commit -m "UPDATE -->
<!-- Actualiza puntero HDEAD de submodulos" -->
<!-- git push -->
<!-- ``` -->
