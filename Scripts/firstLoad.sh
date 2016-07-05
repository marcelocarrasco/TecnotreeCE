#!/bin/bash

## declare an array variable
declare -a arr=$1 #("element1" "element2" "element3")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "/home/oracle/Pentaho/data-integration/kitchen.sh -file=/home/oracle/TecnotreeCE/PentahoSourceFiles/ProcessCMData.kjb -param:FECHA=$i"
   sh /home/oracle/Pentaho/data-integration/kitchen.sh -file=/home/oracle/TecnotreeCE/PentahoSourceFiles/ProcessCMData.kjb -param:FECHA="$i" -level=Minimal
   # or do whatever with individual element of the array
done
