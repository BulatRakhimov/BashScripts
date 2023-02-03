#!/bin/bash
res=$(docker inspect --format='{{.LogPath}}' $(docker ps -aq))
stroky=$(echo "$res"|wc -l)
#for (( i=1; i<=$stroky; i++ )); do
                            #code=$(sudo docker ps -a | cut -c 1-12 | head -n$i | tail -n1);
                            # path=$(sudo docker inspect $code | grep "LogPath" | awk '{print substr ($ 0, 21)}' | awk '{print substr ($ 0, 1, length($ 0) -2)}');
path=$(docker inspect --format='{{.LogPath}}' $(docker ps -aq)) #| head -n$i | tail -n1 );
#echo "$path"
#sudo echo " " > "$path"
                            #razmer=$(sudo wc -c $path | grep -oE "[0-9]{1,100}" | head -n3);
                            # if [[ ${#path}<1 ]]; then
                            # continue  
                            # fi;
#sudo du -h "$path"
#done 
for i in $path
do
   echo "S" > $i;
done
