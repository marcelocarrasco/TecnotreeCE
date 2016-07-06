#!/bin/bash

## declare an array variable
declare -a arr=$1 #("element1" "element2" "element3")

## now loop through the above array
for i in "${arr[@]}"
do
   ## sh /home/oracle/Pentaho/data-integration/kitchen.sh -file=/home/oracle/TecnotreeCE/PentahoSourceFiles/ProcessCMData.kjb -param:FECHA="$i" -level=Minimal
   sh /home/oracle/Pentaho/data-integration/kitchen.sh -file=/home/oracle/TecnotreeCE/PentahoSourceFiles/ProcessCDCData.kjb -param:FECHA="$i" -level=Minimal
   # or do whatever with individual element of the array
done
