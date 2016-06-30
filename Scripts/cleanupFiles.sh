#!/bin/bash
FILES=$1/Datos/$2/tpsfiles/*.csv
for f in $FILES
do
  # Delete all trailing blank lines at end of file (only).
  sed -i '/^\s*$/d' $f
done
