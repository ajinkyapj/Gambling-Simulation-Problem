
#!/bin/bash -x

day=1
amount=100
stake=100
win=0
lost=0
high=150
low=50
luckyamount=0
unluckyamount=100
luckyday=0
unluckyday=0

while [[ $day -le 30 ]]
do
        if [[ $amount -lt 100 ]]
        then
               break
        fi
        let "stake=100"
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
                if [[ $unluckyamount -ge $amount ]]
                then
                let "unluckyamount=$amount"
                let "unluckyday=$day"
                fi
                let "lost+=1"
                echo "Day $day: $amount"
        else
                if [ $luckyamount -lt $amount ]
                then
                let "luckyamount=$amount"
                let "luckyday=$day"
                fi
                let "win+=1"
                echo "Day $day: $amount"
        fi
        let day+=1
done
echo "Win : $win "
echo "Lost : $lost "
echo "Luckiest day is $luckyday and amount is $luckyamount"
echo "Unluckiest day is $unluckyday and amount is $unluckyamount"

if [[ $day -eq 31 && $amount -ge 100 ]]
then
        echo "You can play next month."
else
        echo "$day"
        echo "You have insufficient balance to play next month. "
fi
