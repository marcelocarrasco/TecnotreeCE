#!/bin/bash
<<'COMMENT'
Este script copia todos los archivos mencionados de una determinada fecha.
La idea es utilizarlo en los casos de rework donde todos los archivos fallaron o no existian en el origen.
Usage: scoTecnotreeDate.sh 'ddmmyyyy'
COMMENT

scp celogs@10.48.69.68:/data1/arce/data/tpsfiles/*_$1.csv /calidad/TecnotreeCE/Datos/arce/tpsfiles
scp celogs@10.48.69.68:/data1/pyce/data/tpsfiles/*_$1.csv /calidad/TecnotreeCE/Datos/pyce/tpsfiles
scp celogs@10.48.69.68:/data1/uyce/data/tpsfiles/*_$1.csv /calidad/TecnotreeCE/Datos/uyce/tpsfiles
exit
