#!/bin/bash
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

echo -e "${RED}[+]${GREEN} Instalando software ${RESET}"
sudo sudo apt-get install crunch

git clone https://github.com/DanielTorres1/PassGen
cd PassGen
bash instalar.sh

sudo mkdir /usr/share/wordlists 2>/dev/null
sudo cp -R * /usr/share/wordlists/ 2>/dev/null

cd /usr/share/wordlists/


echo -e "${RED}[+]${GREEN} Generando diccionarios (apellidos) ${RESET}" 
sudo /usr/bin/passGen.sh -f base/nombres/apellidos.txt -t offline -o apellidos.txt -v 1
echo -e "${RED}[+]${GREEN} Generando diccionarios (departamentos) ${RESET}"
sudo /usr/bin/passGen.sh -f base/nombres/departamentos.txt -t offline -o departamentos.txt -v 1
echo -e "${RED}[+]${GREEN} Generando diccionarios (equipos) ${RESET}"
sudo /usr/bin/passGen.sh -f base/nombres/equipos.txt -t offline -o equipos.txt -v 1
echo -e "${RED}[+]${GREEN} Generando diccionarios (nombres y diminutivos) ${RESET}"
sudo /usr/bin/passGen.sh -f base/nombres/nombres.txt -t offline -o nombres.txt -v 1



echo -e "${RED}[+]${GREEN} Generando diccionarios (numeros) ${RESET}"

echo -e "${GREEN}[+] De 4 digitos ${RESET}"
sudo crunch 4 4 1234567890 -o 4digits.txt
echo -e "${GREEN}[+] De 5 digitos ${RESET}"
sudo crunch 5 5 1234567890 -o 5digits.txt
echo -e "${GREEN}[+] De 6 digitos ${RESET}"
sudo crunch 6 6 1234567890 -o 6digits.txt
echo -e "${GREEN}[+] De 7 digitos ${RESET}"
sudo crunch 7 7 1234567890 -o 7digits.txt
echo -e "${GREEN}[+] De 8 digitos ${RESET}"
sudo crunch 8 8 1234567890 -o 8digits.txt



echo -e "${RED}[+]${GREEN} Descomprimiendo archivos ${RESET}"
sudo cat *.tar.bz2 | tar -jxvf - -i
sudo rm *.tar.bz2


cd base/nombres
echo -e "${GREEN}[+] Mutando nombres (Fomato: Nombre + Teamo/miamor) ${RESET}"
sudo bash -c 'bash rules1.sh > ../../nombre-teamo.txt &' 

echo -e "${GREEN}[+] Mutando nombres (Fomato: Nombre + apellido) ${RESET}"
sudo bash -c 'bash rules2.sh > ../../nombre-apellido.txt &'

echo -e "${GREEN}[+] Mutando nombres (Fomato: Nombre + y + Nombre) ${RESET}"
sudo bash -c 'bash rules3.sh > ../../nombre-nombre.txt &'

echo -e "${GREEN}[+] Mutando nombres (Fomato: Prefijo + nombre) ${RESET}"
sudo bash -c 'bash rules4.sh > ../../prefijo-nombre.txt &'



# check if we have any script running
while true; do
	script_instances=`ps aux | grep 'rule' | wc -l`		
	if [ "$script_instances" -gt 1 ]
	then
		echo -e "\t[-] Todavia hay scripts activos ($script_instances)"				
		sleep 60
		else
			break		
		fi
done	# done true	


