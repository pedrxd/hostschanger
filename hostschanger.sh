#!/bin/bash
# :author: Pedro Ruiz 
# :description: Change hostname depending if you are on your lan or not

# Check if the computer is connected to a specific router
# One param should be the ip of router and the other one should be the mac
function isConnected {
  connected=1
  
  #Bit dirty procedure. If Lan ip and mac is present on a line, it means you are connected.
  mapfile -t response < <( ip neigh | grep $1 | grep $2 )
  if [ ${#response[*]} -ge 1 ]
  then
    connected=0
  fi
  return $connected
}


hostsfile=/etc/hosts
if [ ${#} -eq 4 ]
then
    if isConnected $1 $2 ; 
    then
      # ----- ToDo when connected to lan ----
      
      #Check if the file is updated
      if ! grep -q "$3 $4" ${hostsfile} ;
      then
        echo "Updating hostname entry (local)"
        grep -v "$4" ${hostsfile} > ${hostsfile}.tmp
        cp ${hostsfile}.tmp ${hostsfile}
        rm ${hostsfile}.tmp
        echo "$3 $4" >> ${hostsfile}
      fi
      
      
    else
      # ----- ToDo when not connected to lan ----
      
      #Check if the file is updated
      if grep -q "$3 $4" ${hostsfile} ;
      then
        echo "Updating hostname entry (no local)"
        grep -v "$4" ${hostsfile} > ${hostsfile}.tmp
        cp ${hostsfile}.tmp ${hostsfile}
        rm ${hostsfile}.tmp
      fi
      
      
    fi
else
  echo "Usage: $0 [routerip] [mac] [localip] [externalip]"
fi
