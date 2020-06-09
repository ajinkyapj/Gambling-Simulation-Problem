#!/bin/bash -x

day=1
amount=100
stake=100
stake2=100
win=0
lost=0
high=150
low=50

declare -a result
while [[ $day -le 30 ]]
do
        stake=$stake2
        while [[ $stake -gt $low && $stake -lt $high ]]
        do
                gamble=$(( RANDOM % 2 ))
                if [[ $gamble -eq 1 ]]
                then
                        let "stake+=1"
                else
                        let "stake-=1"
                fi

        done
        if [ $stake -eq $low ]
        then
                let "lost+=1"
                echo "Day $day: $stake"
        else
                let "win+=1"
                echo "Day $day: $stake"
        fi
        let day+=1
declare -A temp

temp[day]=$day
temp[win]=$win
temp[lost]=$lost
temp[amount]=$amount

result[$day]=temp

done
echo "Win : $win "
echo "Lost : $lost "
