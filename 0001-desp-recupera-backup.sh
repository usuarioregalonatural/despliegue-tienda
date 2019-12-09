#!/bin/bash

# Importa variables

        source ./00000-entorno.cfg


echo  ""
echo "########################################"
echo "### RECUPERANDO BACKUP COMPLETO TIENDA ##"
echo "########################################"
echo ""

# Recuperacion de la copia del docker de la tienda

	# Descomentar la siguiente linesa para realizar la descarga del backup desde remoto
        #scp -r -P ${HOST_BACKUP_PUERTO} ${HOST_BACKUP_NOMBRE}:${HOST_BACKUP_RUTA} ${RUTA_TEMP}
        scp -r -P ${HOST_BACKUP_PUERTO} ${HOST_BACKUP_NOMBRE}:${FILEUSERCONNECT} ${RUTA_TEMP}

	# Comentar para realizar la descarga del backup desde remoto
#	cp -r /home/temp/20191116 ${RUTA_TEMP}
	cd ${RUTA_TIENDA}

	git clone ${GIT_TIENDA_WEB}
        mv ${WEB_GIT} web-prod	
#	git clone https://github.com/usuarioregalonatural/web-prod.git

#### Añadido para recuperar y descomprimier el volvado de la base de datos

	cd web-prod
	gzip -d ${SQL_BBDD}.gz
####

	cd ${RUTA_TIENDA}
