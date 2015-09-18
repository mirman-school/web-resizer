#!/bin/bash
imagedir=$1
cd $imagedir
LIST="$(ls | egrep '\.(png|gif|jpg|jpeg)')"
mkdir Web_Full
mkdir Web_Thumb
for i in $LIST; do
  cp $i Web_Full
  cp $i Web_Thumb
done
cd Web_Full
FULLS="$(ls | egrep '\.(png|gif|jpg|jpeg)')"
for i in $FULLS; do
  newpic=full-$i
  mv $i $newpic
  sips -Z 800 $newpic
done
cd ../Web_Thumb
THUMBS="$(ls | egrep '\.(png|gif|jpg|jpeg)')"
for i in $THUMBS; do
  newthumb=thumb-$i
  mv $i $newthumb
  sips -Z 200 $newthumb
done
