Readme


Ojo, solo está preparado de momento para restaurar el backup de Produccion 
por lo que si queremos hacer pruebas de test hay que copiar las carpetas
de prod-bbdd y prod-web a test-bbdd y test-web para que tengan contenido



* Las imagenes no se ven cuando se despliega porque el backup tiene url amigables
hay que entrar al backoffice y desactivarlas para que las imagenes se vean bien.


## TIPS

- en la ruta de la web -> **config/defines.inc.php** se puede cambiar para ejecutar en 
modo desarrollo y poder ver errores:

``` php 
/* Debug only */
if (!defined('_PS_MODE_DEV_')) {
define('_PS_MODE_DEV_', true);
}
```

cambiar a true o false si queremos ver o no los errores




## Siguiente mejora (Hecho!)

Se independiza la bbdd en un docker distinto. También PHPMyAdmin
Se ha incluido el despliegue con docker-compose

## Siguiente mejora (Hecho!)

Se personalizan las imagenes docker de la web y del MySQL
Principalmente se ha personalizado la imagen de la web

* Ojo, cuando ejecuta MySQL no es posible conectar con root desde PhpMyAdmin, 
es necesario meterse dentro del docker de mysql y ejecutar

```bash
mysql -u root -p 
```
introducir la password de root y salir.
Esto generará el usuario root con host=% y ya nos permitirá acceder con normalidad

También hay que hacer una modificación en el fichero web:

```php
app/config/parameters.php
```
habrá que indicarla en el host el nombre del docker de MySQL.

* Falta realizar esta sustitución automáticamente.

* Falta poder ejecutar sql dentro del docker para asignar correctamente dominio y SSL/noSSL





## TIPS
Podemos comprobar la conexion de la web con la base de datos creando el siguiente fichero en la ruta de la web:
```php
<?php

define("DB_HOST", "tienda-mysql");//DB_HOST:  generalmente suele ser "127.0.0.1"
define("DB_NAME", "mysql");//Nombre de la base de datos
define("DB_USER", "root");//Usuario de tu base de datos
define("DB_PASS", "password");//Contraseña del usuario de la base de datos

        # conectare la base de datos
    $con=@mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if(!$con){
        die("imposible conectarse: ".mysqli_error($con));
    }
    if (@mysqli_connect_errno()) {
        die("Conexión falló: ".mysqli_connect_errno()." : ". mysqli_connect_error());
    }

?>
<table border="1">
<?php

 $sql=mysqli_query($con, "select host, user from mysql.user;");
    while ($row=mysqli_fetch_array($sql)) {
        $host = $row["host"];
        $user = $row["user"];
        ?>
        <tr>
        <td><?php echo $host ?></td>
        <td ><?php echo $user ?></td>
                </tr>
        <?php
    }
?>
</table>
<?php
?>
```
