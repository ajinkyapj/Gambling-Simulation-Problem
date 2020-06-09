#!/bin/bash -x

day=1
amount=100
stake=100
stake2=100
win=0
lost=0
high=150
low=50
lucky=0
unlucky=100
luckyday=0
unluckyday=0
declare -a winarr
declare -a lostarr
declare -a result
while [[ $day -le 30 ]]
do
        if [[ $amount -lt 100 ]]
        then
                break
        fi
        stake=$stake2
        while [[ $stake -gt $low && $stake -lt $high ]]
        do
                gamble=$(( RANDOM % 2 ))
                if [[ $gamble -eq 1 ]]
                then
                        let "stake+=1"
                        let "amount+=1"
                else
                        let "stake-=1"
                        let "amount-=1"
                fi

        done
        if [ $stake -eq $low ]
        then
                if [ $unlucky -ge $amount ]
                then
                let "unlucky=$amount"
                let "unluckyday=$day"
                fi
                lostarr[$day]=$amount
                let "lost+=1"
                echo "Day $day: $amount"
        else
                if [ $lucky -lt $amount ]
                then
                let "lucky=$amount"
                let "luckyday=$day"
                fi
                winarr[$day]=$amount
                let "win+=1"
                echo "Day $day: $amount"
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
echo "Luckiest day is $luckyday and amount is $lucky"
echo "Unluckiest day is $unluckyday and amount is $unlucky"

