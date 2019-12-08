#!/bin/bash

echo "      "
echo "#################################################"
echo "##  GENERANDO DOCKER TIENDA ..........        ###"
echo "#################################################"
echo "      "

#################################################
# Importa variables
#################################################

        source ./00000-entorno.cfg
        source ./funciones.sh

TAG="1.0"

RUTA_DOCKERFILE=${RUTA_DOCKERS}/tienda/${ENTORNO_UPPER}
RUTA_FILES_DOCKER=${RUTA_DOCKERFILE}/ficheros-docker


if [ ${ENTORNO_UPPER} == "TEST" ];
then
	PUERTO_WEB=${TEST_PUERTO_WEB}
	PUERTO_MYSQL=${TEST_PUERTO_MYSQL}
	VIRTUAL_HOST=${TEST_VIRTUAL_HOST}
	DNS=${TEST_DNS}
	RUTA_WEB=${TEST_RUTA_WEB}
	RUTA_MYSQL=${TEST_RUTA_MYSQL}
	RUTA_LOGS=${TEST_RUTA_LOGS}
	export URL_TIENDA=${URL_TIENDA_TEST}
elif [  ${ENTORNO_UPPER} == "PROD" ];
then
        PUERTO_WEB=${PROD_PUERTO_WEB}
        PUERTO_MYSQL=${PROD_PUERTO_MYSQL}
        VIRTUAL_HOST=${PROD_VIRTUAL_HOST}
        DNS=${PROD_DNS}
        RUTA_WEB=${PROD_RUTA_WEB}
        RUTA_MYSQL=${PROD_RUTA_MYSQL}
        RUTA_LOGS=${PROD_RUTA_LOGS}
	export URL_TIENDA=${URL_TIENDA}
else
        echo "Como puede ser que aqui no esten definidos los entornos????"
	exit 323
fi

#export NOMBRE_IMAGEN="vicsoft01/tienda-${ENTORNO}${SUFIJO_NOMBRE_CONTENEDOR}:${TAG}"
export NOMBRE_IMAGEN="imgbasewww"
export NOMBRE_IMAGEN_SIN_TAG="vicsoft01/tienda-${ENTORNO}${SUFIJO_NOMBRE_CONTENEDOR}"
export NOMBRE_IMAGEN_WWW="${ENTORNO}regnatwww"
export NOMBRE_IMAGEN_BBDD="${ENTORNO}regnatbbdd"


backup_dockerfiles

parsea_dominio
parsea_htaccess
parsea_activacion_root_mysql
parsea_seteo_dominio_ssl
copia_base_files
recoge_cert_ssl

#construye_imagen
construye_imagen_www
eliminar_contenedor 

construye_cmd_docker
ejecuta_compose
#ejecuta_docker
activarootmysql
setear_dominio_ssl

muestra_variables


