## Desarrollo del proyecto.

### Análisis del mercado.

Para el estudio previo se analizó el mercado, consultando algunas páginas que ofrecen la misma funcionalidad en la actualidad.

#### Ruta del veleta [Enlace](http://www.rutadelveleta.com/reservas/).

Tras estudiar un poco esta página se determinó que la experiencia de usuario no es buena, a pesar de que se pueden realizar reservas en el restaurantes, resulta difícil realizar la transacción por lo complejo de su formulario y en ningún caso muestra disponibilidad.

#### Bodega el Capricho [Enlace](https://bodegaelcapricho.com/es/reservar/)

Esta otra opción es mucho más atractiva visualmente y permite en pocos pasos realizar la reserva de una mesa en el restaurante. Pero finalmente el cliente se encuentra con un complejo formulario por rellenar antes de terminar el proceso.

#### Conclusión

Tras observar estas y otras páginas se decidió optar por un modelo mucho más sencillo en el que el usuario no tuviera que rellenar un gran formulario con muchos datos. Al igual que al reservar por teléfono, normalmente se pide hora, número de comensales y un nombre para la reserva, en la web no se mostrarán complejos formularios, solo lo mínimo.

Este enfoque expone la posibilidad de que se reciban reservas falsas o que malintencionadamente alguien bloqueé el sistema. Por esta razón se ha decidido con el cliente, mostrar solo una parte de la disponibilidad en la web para evitar que esta vulnerabilidad suponga un desastre financiero.

### Metodologías utilizadas.

Al constar de una sola persona el grupo de trabajo, se a optado por implementar la metodología en cascada. Desde un principio se han separado las diferentes partes del proyecto y se han definido sus funcionalidades. Con esta metodología cada etapa finaliza con cada una de las partes o funcionalidades. Se puede decir que el proyecto ha seguido el siguiente orden:

Entorno de desarrollo -> creación apis -> contenedor api -> proyecto angular -> contenedor web -> despliegue.

Si al desarrollar una etapa se ha detectado un error en la anterior se a reparado indistintamente ya que no existe un sistema de generación de tickets (issue tracking system) para su posterior reparación.

Creo que para proyectos unipersonales es una buena opción y cualquier alternativa ágil supondría un incremento en complejidad que debería estudiarse.

### Descripción de los componentes.

Para este proyecto he creado tres repositorios diferentes, front, server, root. Cada uno de ellos tiene una función específica dentro del conjunto pero se puede trabajar en ellos de forma independiente. Para esto he usado _git submodule_, esta funcionalidad permite especificar dentro de un repositorio si algún directorio hace referencia ha otro repositorio diferente. De este modo el módulo _root_ además de su propio contenido también hace referencia a un commit concreto de cada uno los otros repositorios. Este enfoque permite trabajar de forma independiente en los módulos y según avanza el proyecto actualizar el commit al que hace referencia la raíz para que así el repositorio principal quede actualizado.

Es especialmente útil para  trabajar con diferentes equipos sobre el mismo proyecto, pero he pensado que podría ser muy buena idea implementarlo para mantener siempre la independencia entre los diferentes módulos sin que el trabajo en uno afecte a otro.

De este modo se puede determinar que el cliente recibirá una aplicación completa y funcional divida en tres componentes principalmente. Cada uno de ellos está acompañado de un _README_ con anotaciones sobre su compilación y puesta en funcionamiento. Los componentes son:
1. front: Contiene aplicación web con la que el usuario interactúa directamente.
2. server: Contiene servidor api para el intercambio de información entre el front y la base de datos.
3. root: Contiene los dos módulos anteriores, además de los manifiestos para su despliegue.

#### Front

Aplicación web con partes estáticas y otras dinámicas. Algunas partes de esta aplicación son ficheros html y css, los cuales sirven para dar información al usuario sobre la empresa. Esta información está compuesta por diferentes apartados describiendo los servicios que se prestan, métodos de contacto y otra información importante para el usuario.

También incluye otra parte dinámica, la cual se ha construido usando el conocido framework de javascript Angular. Esta parte sirve para mostrar la disponibilidad y permite realizar reservas en el establecimiento. Una vez que el usuario entra en la ruta _/reserva/_ la aplicación se conecta al servidor para obtener la disponibilidad de mesas y con los datos obtenidos, procede a mostrarlos en pantalla.

El usuario tiene la posibilidad de consultar otra fecha diferente y una vez elegida la mesa deseada puede pulsar un botón para reservar. Esta acción le mostrará un formulario con algunos datos requeridos, nombre y número de comensales. Una vez completado y enviado, si todo ha ido bien se le confirmará que ha sido aceptada la reserva y se actualizará la disponibilidad para que el usuario pueda comprobar que la mesa ya no está disponible.

#### Server

Este componente sirve de intermediario entre la base de datos y la aplicación web. Su función es gestionar las peticiones que llegan desde el front lo más eficientemente posible, consultando la base de datos y devolviendo la información correcta.

Para este cometido he decidido usar el no tan conocido framework de Rust, Rocket. Se caracteriza por su seguridad, estabilidad y velocidad. A pesar de lo complejo que pueda parecer, una vez que conocer un poco el lenguaje y lees la documentación resulta muy sencillo para la creación servidores web.

Ya que este módulo se encarga de comunicarse con la base de datos, también integra las migraciones, que permiten al servidor crear las tablas y las relaciones necesarias en la base de datos previamente creada. Se ha decidido usar Postgresql como gestor de base de datos por sus muchas funcionalidades pero sobre todo por la gran velocidad de respuesta que tiene.

Para intermediar entre el servidor web, el cual recibe las peticiones y devuelve los datos, y la base de datos he usado _diesel_ que funciona como orm en rust, facilitando escribir las peticiones a la base de datos en este lenguaje. Sinceramente esta ha sido quizá la parte más difícil, por la complejidad de esta librería, la cual además depende de una librería de C _libpq_, por lo que compilar para arquitecturas arm64 y sistemas operativos tipo _musl_ resulta complejo.

Tras la compilación de este módulo se obtiene un binario que se puede ejecutar directamente en el servidor, siempre y cuando exista la base de datos y tenga los permisos adecuados. 

#### root

El componente raíz del proyecto tiene dos funcionalidades. Una es contener la documentación relacionada con el proyecto, así como describir el proceso de despliegue de la aplicación. Y por otro lado sirve para mantener las referencias a los commit concretos de cada submodulo. Esto quiere decir, que al haber implementado git submodule, cada vez que uno de los submodulos se actualiza no afecta directamente al proyecto, sino que desde la raíz deberá actualizarse la referencia de cada submodulo directamente. Esto permite actualizar, testear la aplicación y se algo no funciona volver a apuntar a un commit anterior hasta que se repare el error y se pueda volver a actualizar testear y finalmente desplegar.

Tanto el módulo front como server están pensados para ser incrustados en una imagen de docker y ser consumidos como contenedores en un servidor de kubernetes. Por esta razón en el módulo principal se acompañan los manifiestos necesarios para que todo se despliegue correctamente en la nube.

La base de datos se contrataría a parte y en estos manifiestos se pegarían las credenciales de conexión. También se deberían de ejecutar las migraciones previamente al despliegue, ya que son estas (las migraciones), las que generan las tablas y relaciones que la aplicación necesita, pero este proceso se describe con más detalle en el _README_ del módulo server.

También se ha agregado el borrador del proyecto en este mismo repositorio para la entrega final de este, pero el cliente recibiría un manual de usuario y un manual técnico en su lugar.

### Resultados obtenidos.

Los objetivos establecidos para el proyecto se ha cumplido en su totalidad y en los plazos impuestos, 40 horas de desarrollo.

**TODO**:
- [x] Integrar botón reserva en web actual.
- [x] Crear CRUD para mesa y reserva.
- [x] Crear endpoint consulta disponibilidad.
- [x] Integrar Angular en la web.
- [x] Usar Angular para interactuar con el servidor.
- [x] Contenerizar la aplicación.

Como se aprecia en la lista, todos los _todo_ se han completado y la aplicación actualmente se está ejecutando correctamente en un laboratorio domestico online, para que el cliente pueda testearla antes de la entrega final. Una vez que el cliente diese su visto bueno, se procesaría el pago final de la aplicación y se le entregaría un fichero con todo el código fuente, documentación así como los derechos legales sobre lo entregado. Como parte del contrato también se desplegaría la aplicación y se mantendría durante los primeros meses haciendo revisiones y comprobando la telemetría que ofrecen los servidores kubernetes. Al concluir este periodo se le presentaría al cliente un dosier de posibles mejoras y una propuesta de mantenimiento a largo plazo.
