

Introducción propuesta al cliente

**IDEA** quizá introducir algunas comparaciones entre tecnologías.

Tras el estudio de los requerimientos del cliente se ha llegado a la decisión de dividir el proyecto en tres secciones:

1. Front-end
2. Back-end
3. Despliegue
4. Actualización

Cada uno de estas secciones se describe más adelante.

### Front-end.

.Proyecto Angular.

.Inclusión de Angular. Razón de elegir este framework.

Hemos decidido usar Angular como framework de javascript. Lo implementaremos solo en una ruta concreta de la aplicación (/reserva), ya que el resto de la web seguirán siendo html y css. Con esto evitamos que el proyecto crezca en complejidad y solo cargue la aplicación en un punto determinado en el que usuario de la web está interesado en consultar disponibilidad para realizar una reserva.

A nivel de desarrollo Angular construye una SPA que se alojará en el directorio _reserva_. Mientras que el directorio _Angular_ será ignorado en el despliegue y por lo tanto solo se usa para el desarrollo y construcción de la SPA.

### Actualización.

Modificación de la web actual.

Nueva entrada en la web. Inserción botón.

En general la web se verá igual que hasta ahora. Tan solo se observará un nuevo botón en la barra de navegación _reserva_. Este será el punto de entrada para el nuevo gestor de reservas que pretendemos implementar.

### Back-end.

.Entre bastidores

Para poder almacenar la información necesitamos una base de datos y para comunicarnos con ella necesitamos crear una servidor que entregue la información a la aplicación cliente. Esta aplicación, que se conoce como servidor api, se escribirá en Rust y he decidido usar rocket como web framework.

Rust es un lenguaje de programación moderno, confiable y eficiente. Permite crear aplicaciones muy eficientes gracias a que no usa runtime ni garbage collector, también usa ownership para garantizar memory-safety. Con todo esto y muchas otras ventajas creo que es uno de los lenguajes más potentes en la actualidad.

Rocket es un web framework desarrollado en Rust que facilita el desarrollo de aplicaciones web a nivel de servidor. Está en su versión 0.5 por lo que puede introducir cambios drásticos en futuras versiones, sin embargo es muy consistente y sencillo. No es necesario tener un conocimiento profundo de Rust para crear servidores web sencillos y funcionales.

### Despliegue.

La tecnología más actual y potente para el despliegue de aplicaciones son los contenedores. Con docker podemos crear imágenes de nuestra aplicación que se ejecutaran en servidores en forma de contenedor. Para orquestar los contenedores su utiliza Kubernetes, el cual permite proveer a la aplicación de los requisitos de hardware que necesite (cpu, ram, memoria). También permite el auto escalado de la aplicación en función de las peticiones que reciba.

