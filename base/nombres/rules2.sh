#!/bin/bash      

#####################  

#echo "Fomato: Nombre + apellido"
while read lineA
	do 
    while read lineB
        do 
        	nombre=`echo $lineA`
			Nombre=`echo $lineA | sed 's/^./\u&/'`
			NOMBRE=`echo $lineA | tr '[a-z]' '[A-Z]'`
			
			apellido=`echo $lineB`
			Apellido=`echo $lineB | sed 's/^./\u&/'`
			APELLIDO=`echo $lineB | tr '[a-z]' '[A-Z]'`
        
        
           echo $nombre$apellido
           echo $NOMBRE$APELLIDO
           echo $Nombre$Apellido                     
           
		done < apellidos.txt
done < nombres.txt
		
