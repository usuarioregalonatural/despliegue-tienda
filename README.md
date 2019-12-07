Readme


Ojo, solo está preparado de momento para restaurar el backup de Produccion 
por lo que si queremos hacer pruebas de test hay que copiar las carpetas
de prod-bbdd y prod-web a test-bbdd y test-web para que tengan contenido



* Las imagenes no se ven cuando se despliega porque el backup tiene url amigables
hay que entrar al backoffice y desactivarlas para que las imagenes se vean bien.

## Siguiente mejora (Hecho!)

Se independiza la bbdd en un docker distinto. También PHPMyAdmin
Se ha incluido el despliegue con docker-compose

## Siguiente mejora

Se personalizan las imagenes docker de la web y del MySQL

