#!/bin/bash -x

declare -A coin

totalFlip=200
count=0
while (( $count < totalFlip ))
do
coinFlip=$((RANDOM%2))

   if [[ $coinFlip -eq 1 ]]
   then
      echo "Heads"
      if [ -z "${coin[H]}" ]
      then
      coin[H]=1
      else
      coin[H]=$((${coin[H]}+1))
      fi
   else
      echo "Tails"
      if [ -z "${coin[T]}" ]
      then
      coin[T]=1
      else
      coin[T]=$((${coin[T]}+1))
   fi
fi
((count++))
done

echo "H/T: "${!coin[@]}
echo "Value: "${coin[@]}

Hper=`awk "BEGIN {print (${coin[H]}/$totalFlip)*100}"`
Tper=`awk "BEGIN {print (${coin[T]}/$totalFlip)*100}"`
echo "Head Percentage: $Hper% "
echo "Tail Percentage: $Tper%"

