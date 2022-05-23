## Justificación y objetivos del proyecto

Introducción propuesta al cliente

**IDEA** quizá introducir algunas comparaciones entre tecnologías.

Tras el estudio de los requerimientos del cliente se ha llegado a la decisión de dividir el proyecto en las siguientes secciones:

1. Front-end
2. Back-end
3. Despliegue
4. Actualización

Cada uno de estas secciones se describe más adelante.

### Front-end.

He decidido usar Angular como framework de javascript. Lo implementaré solo en una ruta concreta de la aplicación (/reserva), ya que el resto de la web seguirán siendo html y css. Con esto evitamos que el proyecto crezca en complejidad y solo cargue la aplicación en un punto determinado en el que usuario de la web está interesado en consultar disponibilidad para realizar una reserva.

A nivel de desarrollo Angular construye una SPA que se alojará en el directorio _reserva_. Mientras que el directorio _Angular_ será ignorado en el despliegue y por lo tanto solo se usa para el desarrollo y construcción de la SPA.

### Actualización.

En general la web se verá igual que hasta ahora. Tan solo se observará un nuevo botón en la barra de navegación _reserva_. Este será el punto de entrada para el nuevo gestor de reservas que pretendemos implementar.

En las imágenes se muestra la diferencia entre el menú de navegación inicial y el final:

![imagen_1](images/imagen_1.jpg)

![imagen_2](images/imagen_2.jpg)

### Back-end.

Para poder almacenar la información necesitamos una base de datos y para comunicarnos con ella necesitamos crear una servidor que entregue la información a la aplicación cliente. Esta aplicación, que se conoce como servidor api, se escribirá en Rust y he decidido usar rocket como framework.

Rust es un lenguaje de programación moderno, confiable y eficiente. Permite crear aplicaciones muy eficientes gracias a que no usa interprete ni garbage collector, en su lugar implementa ownership para garantizar un acceso seguro a la memoria siempre. Con todo esto y muchas otras ventajas creo que es uno de los lenguajes más potentes en la actualidad. Además de ser el lenguaje más amado desde 2015, en la conocida encuesta de "stackoverflow survey" [Enlace](https://insights.stackoverflow.com/survey/2021#section-most-loved-dreaded-and-wanted-programming-scripting-and-markup-languages).

![imagen_3](images/imagen_3.jpg)

Rocket es un web framework desarrollado en Rust que facilita el desarrollo de aplicaciones web a nivel de servidor. Está en su versión 0.5 por lo que puede introducir cambios drásticos en futuras versiones, sin embargo es muy consistente y sencillo. No es necesario tener un conocimiento profundo del lenguaje para crear servidores web sencillos y funcionales.

### Despliegue.

La tecnología más actual y potente para el despliegue de aplicaciones son los contenedores. Con docker podemos crear imágenes de nuestra aplicación que se ejecutaran en servidores en forma de contenedor. Para orquestar los contenedores su utiliza Kubernetes, el cual permite proveer a la aplicación de los requisitos de hardware que necesite (cpu, ram, memoria).

Esto hace que esta tecnología se esté implantando rápidamente en la actualidad como reza en el siguiente artículo [Enlace](https://www.datacentermarket.es/mercado/noticias/1131374032609/tres-de-cada-cuatro-grandes-empresas-han-utilizado-kubernetes-2021.1.html), el 75% de las grandes empresas usan kubernetes y por consiguiente la contenerización de aplicaciones.

