#!/bin/bash      

#echo "Fomato: Nombre + y + Nombre"
while read lineA
	do 
    while read lineB
        do 
        	nombre1=`echo $lineA`
			Nombre1=`echo $lineA | sed 's/^./\u&/'`
			NOMBRE1=`echo $lineA | tr '[a-z]' '[A-Z]'`
			
			nombre2=`echo $lineB`
			Nombre2=`echo $lineB | sed 's/^./\u&/'`
			NOMBRE2=`echo $lineB | tr '[a-z]' '[A-Z]'`
        
        
           echo $nombre1"y"$nombre2
           echo $Nombre1"y"$Nombre2
           echo $NOMBRE1"y"$NOMBRE2                  
           
		done < nombres.txt
done < nombres1.txt
		

		
