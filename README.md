Readme


Ojo, solo está preparado de momento para restaurar el backup de Produccion 
por lo que si queremos hacer pruebas de test hay que copiar las carpetas
de prod-bbdd y prod-web a test-bbdd y test-web para que tengan contenido



* Las imagenes no se ven cuando se despliega porque el backup tiene url amigables
hay que entrar al backoffice y desactivarlas para que las imagenes se vean bien.

## Siguiente mejora (Hecho!)

Se independiza la bbdd en un docker distinto. También PHPMyAdmin
Se ha incluido el despliegue con docker-compose

## Siguiente mejora (Hecho!)

Se personalizan las imagenes docker de la web y del MySQL
Principalmente se ha personalizado la imagen de la web

* Ojo, cuando ejecuta MySQL no es posible conectar con root desde PhpMyAdmin, 
es necesario meterse dentro del docker de mysql y ejecutar

``` mysql -u root -p ```
introducir la password de root y salir.
Esto generará el usuario root con host=% y ya nos permitirá acceder con normalidad

También hay que hacer una modificación en el fichero web:

app/config/parameters.php

habrá que indicarla en el host el nombre del docker de MySQL.

* Falta realizar esta sustitución automáticamente.

* Falta poder ejecutar sql dentro del docker para asignar correctamente dominio y SSL/noSSL

