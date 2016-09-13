#!/bin/bash

scp celogs@192.168.16.175:/data1/arce/data/tpsfiles/*_$(date --date=''yesterday'' +%d%m%Y).csv /calidad/TecnotreeCE/Datos/arce/tpsfiles
scp celogs@192.168.16.184:/data1/pyce/data/tpsfiles/*_$(date --date=''yesterday'' +%d%m%Y).csv /calidad/TecnotreeCE/Datos/pyce/tpsfiles
scp celogs@192.168.16.184:/data1/uyce/data/tpsfiles/*_$(date --date=''yesterday'' +%d%m%Y).csv /calidad/TecnotreeCE/Datos/uyce/tpsfiles
exit
