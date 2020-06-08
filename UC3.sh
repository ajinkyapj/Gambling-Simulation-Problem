#!/bin/bash -x

day=1
amount=100
stake=100
win=0
lost=0
        while [[ $stake -gt 50 && $stake -lt 150 ]]
        do
                gamble=$((RANDOM%2))

                if [ $gamble -eq 0 ]
                then
                        let win+=1
                        let stake+=1
                        let amount+=1
                elif [ $gamble -eq 1 ]
                then
                        let lost+=1
                        let stake-=1
                        let amount-=1
                fi

        done
echo "Win : $win "
echo "Lost : $lost "
echo "Stake : $stake"
