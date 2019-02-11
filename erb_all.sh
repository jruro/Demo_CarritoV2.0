#!/bin/bash

if [ "$1" != "-rm" ]; then

	echo "Building all models"

	for carpeta in $(ls)
	
	do
		if [ -f $carpeta/model.rsdf ]; then
			erb $carpeta/model.rsdf > $carpeta/model.sdf
		fi
	done

else

	echo "Erasing all models"

	for carpeta in $(ls) 
	do
		if [ -d $carpeta ]; then
			rm $carpeta/model.sdf
		fi
	done

fi
	
echo "Done"
