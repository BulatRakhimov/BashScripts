#!/bin/bash
res=$(sudo docker ps -a)
stroky=$(echo "$res"|wc -l)
for (( i=2; i<=$stroky; i++ )); do
    code=$(sudo docker ps -a | cut -c 1-12 | head -n$i | tail -n1);
    path=$(sudo docker inspect $code | grep "LogPath" | awk '{print substr ($ 0, 21)}' | awk '{print substr ($ 0, 1, length($ 0) -2)}');
    razmer=$(sudo wc -c $path | grep -oE "[0-9]{1,100}" | head -n1);
    if [[ ${#path}<1 ]]; then
      continue  
    fi;
    echo "$razmer bytes";
done 
