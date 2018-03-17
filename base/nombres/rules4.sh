#!/bin/bash      

#echo "Fomato: prefijo + nombre "
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
        
        			
        
            while read prefijo
			do 						             
           
			echo $prefijo$nombre$prefijo
			echo $prefijo$Nombre$prefijo
			echo $prefijo$NOMBRE$prefijo
			
			echo $prefijo$nombre
			echo $prefijo$Nombre
			echo $prefijo$NOMBRE
					
			echo $nombre$prefijo
			echo $Nombre$prefijo
			echo $NOMBRE$prefijo
			
			echo $prefijo$nombre$apellido	
			echo $prefijo$nombre$apellido$prefijo
			echo $prefijo$NOMBRE$APELLIDO$prefijo	
			
			done < prefijos.txt     				
		done < apellidos.txt
done < nombres.txt
		
