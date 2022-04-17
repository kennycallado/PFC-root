## Resumen del proyecto.

El proyecto se inicia con la hipotética situación en la que nuestro cliente acude a nosotros para actualizar la página web de su negocio. Este nos explica que regenta un restaurante llamado _sensacion_ y que ya dispone de un sitio web informativo sobre su restaurante. Debido a la gran cantidad de usuarios que visitan su sitio, ha decidido implementar un formulario de reserva de mesa.

Tras un estudio previo se ha determinado que para la inclusión de esta nueva mejora se necesitarán 40 horas para el desarrollo del proyecto, así como otro tanto igual de horas para un mantenimiento inicial del sitio hasta que se haya depurado suficientemente bien en producción. Este estudio arroja la siguiente distribución del tiempo en secciones del proyecto:

**Secciones**:
1. Crear entorno desarrollo (git, github, directorios).
2. Creación servidor (postgresql, servidor web, api).
3. Integración y desarrollo cliente (Angular).
4. Contenerización (docker, kubernetes).
5. Lanzamiento y mantenimiento inicial.

**Temporización**:
1. => 5 horas
2. => 20 horas
3. => 10 horas
4. => 5 horas
5. => 40 horas.

Con estos datos el departamento financiero generará un presupuesto previo al inicio del proyecto, que daremos por aceptado y que todas las cuestiones legales serán resueltas por el departamento o persona apropiado.

### Idea inicial.

El cliente describe que actualmente los usuarios de la web, si quieren reservar deben ponerse en contacto directamente con el restaurante, y que muchos de los usuarios desisten de reservar por tener que usar medios externos a la web. En principio quiere integrar las reservas desde la web solo para el servicio de comidas (no cenas) y sin selección de hora. El usuario solo tendría que poner una fecha ver si hay disponibilidad y si es así, escribir su nombre y enviar. No quiere que los usuarios tengan que registrarse para poder reservar y en caso de querer hacer alguna modificación el usuario llamaría al restaurante.

Otro equipo se encargaría de desarrollar un administrador que le permita al cliente gestionar las reservas y las mesas. Este proyecto solo se encarga de mostrar la disponibilidad dada una fecha y permitir crear una reserva a partir de dicha disponibilidad.

### Estado previo.

El cliente nos entrega el código fuente de la página actual para que sirva de inicio para el proyecto. Es un proyecto web sencillo de páginas html que usa bootstrap 5 para los estilos. También integra un fichero _Dockerfile_ ya que actualmente la web está desplegada como un contenedor sobre un servidor de kubernetes.

### Objetivos requeridos.

Tras el estudio y algunas reuniones con el cliente hemos determinado que en el menú de navegación de la web se añadirá un nuevo botón _reserva_, que al ser pulsado iniciará Angular para mostrar la disponibilidad y ayudará al usuario a reservar. Para que esto funcione también se ha determinado que necesitaremos una base de datos con las mesas y las reservas. Para comunicar la base de datos con el cliente se creará una api en el lado del servidor.

Una vez todo esto funcione se generarán las imágenes de docker necesarias para el posterior despliegue de la aplicación en un servidor de kubernetes que el cliente ya tiene contratado.

Se entiende que la siguiente lista son los objetivos requeridos por el proyecto.

**TODO**:
- [ ] Integrar botón reserva en web actual.
- [ ] Crear CRUD para mesa y reserva.
- [ ] Crear endpoint consulta disponibilidad.
- [ ] Integrar Angular en la web.
- [ ] Usar Angular para interactuar con el servidor.
- [ ] Contenerizar la aplicación.

