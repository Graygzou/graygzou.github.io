#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2021 Grégoire Boiron  All Rights Reserved.
#
# Script that run pngquant.
#############################################################################

# Parameters check
echo "$#"
if [ "$#" -eq 0 ]; then
  echo "you need to provide a .txt file and a destination folder to run algorithm on it."
  exit
fi

# Create destination folder if not already there
destination_folder=$2
if [[ ! -d "$destination_folder" ]]
then
  mkdir $destination_folder
fi

asset_path=$(cat $1)
for file in $asset_path
do
  echo "Processing $file file..."
  filename="${file##*/}"
  extension="${file##*.}"
  name="${filename%.*}"

  echo "$filename"
  echo "$extension"
  echo "$name"

  pngquant --ext -opti.png "$file"
  mv "$name-opti.$extension" $destination_folder
done
