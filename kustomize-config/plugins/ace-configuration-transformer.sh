#!/bin/bash

export resourceList=$(cat -)
readarray -t FILES < <(exec echo $resourceList | tr ' ' '\n')

for fileName in "${FILES[@]}"
do
    if [ "${fileName: -5}" == ".yaml" ]
    then
	#fileWithExtension=$(basename $fileName)
	#fileWithoutExtension=$(echo ${fileName} | sed 's/.yaml//g')
	#echo YAML $fileWithoutExtension
	sed -i 's/Dev/Dev edited/g' ${fileName}
    fi
done

echo "$resourceList"
