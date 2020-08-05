#!/bin/bash -x
#!/bin/bash -x
declare -A coin
declare -A coinPer
totalFlips=200
count=0
while (( $count < totalFlips ))
do
coinFlip=$((RANDOM%4))

case $coinFlip in
0) echo "HH"
        if [ -z "${coin[HH]}" ]
   then
      coin[HH]=1
   else
      coin[HH]=$((${coin[HH]}+1))
   fi
;;
1) echo "HT"
        if [ -z "${coin[HT]}" ]
   then
        coin[HT]=1
   else
      coin[HT]=$((${coin[HT]}+1))
   fi
;;
2) echo "TH"
        if [ -z "${coin[TH]}" ]
   then
      coin[TH]=1
   else
      coin[TH]=$((${coin[TH]}+1))
   fi
;;
3) echo "TT"
        if [ -z "${coin[TT]}" ]
   then
      coin[TT]=1
   else
      coin[TT]=$((${coin[TT]}+1))
   fi
;;
esac
((count++))
done

echo "HH/HT/TH/TT: "${!coin[@]}
echo "Value: "${coin[@]}

HHper=`awk "BEGIN {print (${coin[HH]}/$totalFlips)*100}"`
HTper=`awk "BEGIN {print (${coin[HT]}/$totalFlips)*100}"`
THper=`awk "BEGIN {print (${coin[TH]}/$totalFlips)*100}"`
TTper=`awk "BEGIN {print (${coin[TT]}/$totalFlips)*100}"`

coinPer[HH]=[$HHper]
coinPer[HT]=[$HTper]
coinPer[TH]=[$THper]
coinPer[TT]=[$TTper]

echo "HH Percentage: $HHper% "
echo "HT Percentage: $HTper%"
echo "TH Percentage: $THper%"
echo "TT Percentage: $TTper%"
