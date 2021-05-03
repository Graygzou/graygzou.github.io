#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Run ImageMagick algorithms to create different versions of all images
#############################################################################

# See http://www.imagemagick.org/Usage/resize/#resize for more info
resize () {
  file=$1
  extension=$2
  echo $file
  echo $extension
  identify "$file.$extension"
  # Apply the command to override the image
  convert "$file.$extension" -resize $(echo $file | sed -e "s/.*r\([0-9]*x[0-9]*\).*/\1/") "$file.$extension"
  identify "$file.$extension"
}

# See http://www.imagemagick.org/Usage/crop/#crop_gravity for more info
crop_center () {
  file=$1
  extension=$2
  echo $file
  echo $extension
  identify "$file.$extension"
  # Apply the command to override the image once again
  convert "$file.$extension" -gravity Center -crop $(echo $file | sed -e "s/.*c\([0-9]*x[0-9]*\).*/\1/")+0+0 "$file.$extension"
  identify "$file.$extension"
}

# Parameters check
echo "$#"
if [ "$#" -eq 0 ]; then
  echo "you need to provide a root folder and a file extension to run algorithm on it."
  exit
fi

# 
resizing_pattern=".*\[r[0-9]+x[0-9]+\].*"
crop_pattern=".*\[c[0-9]+x[0-9]+\].*"

# Create destination folder if not already there
destination_folder="jekyll/assets/output"
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
  
  # Debug
  echo "$filename"
  echo "$extension"

  # Removing relative path to only have filename
  #filename=$(echo $filename | sed -E "s/[\.*\/*]*(.*)/\1/")

  # Copy the file in the output folder
  copied_file="$destination_folder/$filename.$extension"
  cp "$file" "$copied_file"

  copied_file="$destination_folder/$filename"
  
  if [[ "$file" =~ $resizing_pattern ]]; then
    echo "travis_fold:start:imageMagickResize"
    echo "Resize the file found"
    resize "$copied_file" "$extension"
    echo "travis_fold:end:imageMagickResize"
  fi
  if [[ "$file" =~ $crop_pattern ]]; then
    echo "travis_fold:start:imageMagickCrop"
    echo "Crop the file found"
    crop_center "$copied_file" "$extension"
    echo "travis_fold:end:imageMagickCrop"
  fi
done

# Debug
git status
