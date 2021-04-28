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
  convert "$file.$extension" -resize $(echo $file | sed -e "s/.*r\([0-9]*x[0-9]*\).*/\1/") "$file-resized.$extension"
  identify "$file-resized.$extension"
}

# See http://www.imagemagick.org/Usage/crop/#crop_gravity for more info
crop_center () {
  file=$1
  extension=$2
  echo $file
  echo $extension
  identify "$file.$extension"
  # Apply the command to override the image once again
  convert "$file.$extension" -gravity Center -crop $(echo $file | sed -e "s/.*c\([0-9]*x[0-9]*\).*/\1/")+0+0 "$file-cropped.$extension"
  identify "$file-cropped.$extension"
}

# Parameters check
echo "$#"
if [ "$#" -eq 0 ]; then
  echo "you need to provide a root folder and a file extension to run algorithm on it."
  exit
fi

# jekyll/assets/
resizing_pattern=".*\[r[0-9]+x[0-9]+\].*"
crop_pattern=".*\[c[0-9]+x[0-9]+\].*"

asset_path=$1;
for file in $asset_path
do
  echo "Processing $file file..."
  filename="${file%.*}"
  extension="${file##*.}"
  
  # Removing relative path to only have filename
  filename=$(echo $filename | sed -E "s/[\.*\/*]*(.*)/\1/")

  # Debug
  echo "$filename"
  echo "$extension"
  
  if [[ "$file" =~ $resizing_pattern ]]; then
    echo "travis_fold:start:imageMagickResize"
    echo "Resize the file found"
    resize "$filename" "$extension"
    # Change the filename to use to resize filename for the crop part if needed
    #filename="$filename"
    echo "$filename"
    echo "travis_fold:end:imageMagickResize"
  fi
  if [[ "$file" =~ $crop_pattern ]]; then
    echo "travis_fold:start:imageMagickCrop"
    echo "Crop the file found"
    crop_center "$filename" "$extension"
    echo "travis_fold:end:imageMagickCrop"
  fi
done

# Debug
git status
