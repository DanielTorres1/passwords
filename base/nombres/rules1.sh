#!/bin/bash      

while read line           
do           
    minuscula=`echo $line`
    Minuscula=`echo $line | sed 's/^./\u&/'`
    MAYUSCULA=`echo $line | tr '[a-z]' '[A-Z]'`
    
    echo $minuscula"teamo"
    echo $MAYUSCULA"TEAMO"
    echo $MAYUSCULA"teamo"
    echo $Minuscula"teamo"
    
    echo $minuscula"miamor"
    echo $MAYUSCULA"MIAMOR"
    echo $MAYUSCULA"miamor"
    echo $Minuscula"miamor"
    
    echo "teamo"$minuscula
    echo "teamo"$Minuscula
    echo "teamo"$MAYUSCULA
    echo "TEAMO"$MAYUSCULA
    
    echo $minuscula"amor"
    echo $MAYUSCULA"AMOR"
    echo $MAYUSCULA"amor"
    echo $Minuscula"amor"
    
    echo "123"$minuscula"321"    
    echo "123"$MAYUSCULA"321"
    echo "123"$Minuscula"321"  					     
done <nombres.txt
		
