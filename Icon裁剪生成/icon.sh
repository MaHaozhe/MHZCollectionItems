#!/bin/sh

filename="icon.png"

dirname="image"

filename_array=("icon-20@2x.png" "icon-20@3x.png" "icon-29@2x.png" "icon-29@3x.png" "icon-40@2x.png" "icon-40@3x.png" "icon-60@2x.png" "icon-60@3x.png")

size_array=("40" "60" "58" "87" "80" "120" "120" "180")

mkdir $dirname

for ((i=0;i<${#size_array[@]};++i)); do

mkdir $dirname

m_dir=$dirname/${filename_array[i]}

cp $filename $m_dir

sips -Z ${size_array[i]} $m_dir

done
