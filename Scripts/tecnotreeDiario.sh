#!/bin/bash
ps cax | grep tecnotree.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/TecnotreeCE/Scripts/scpTecnotree.sh
  sh /calidad/TecnotreeCE/Scripts/cleanupFiles.sh '/calidad/TecnotreeCE' 'arce'
  sh /calidad/TecnotreeCE/Scripts/cleanupFiles.sh '/calidad/TecnotreeCE' 'pyce'
  sh /calidad/TecnotreeCE/Scripts/cleanupFiles.sh '/calidad/TecnotreeCE' 'uyce'
   sh /calidad/TecnotreeCE/Scripts/tecnotree.sh
fi
exit
