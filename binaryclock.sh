#!/usr/bin/env bash

year=$(date +%y | sed "s/^0*//g")
month=$(date +%m | sed "s/^0*//g")
day=$(date +%d | sed "s/^0*//g")

hour=$(date +%H | sed "s/^0*//g")
minute=$(date +%M | sed "s/^0*//g")
second=$(date +%S | sed "s/^0*//g")

binary=("000000" "000001" "000010" "000011" "000100" "000101" "000110" "000111" "001000" "001001" "001010" "001011" "001100" "001101" "001110" "001111" "010000" "010001" "010010" "010011" "010100" "010101" "010110" "010111" "011000" "011001" "011010" "011011" "011100" "011101" "011110" "011111" "100000" "100001" "100010" "100011" "100100" "100101" "100110" "100111" "101000" "101001" "101010" "101011" "101100" "101101" "101110" "101111" "110000" "110001" "110010" "110011" "110100" "110101" "110110" "110111" "111000" "111001" "111010" "111011" "111100" "111101" "111110" "111111")

font=(["000"]='' ["001"]='' ["010"]='' ["011"]='' ["100"]='' ["101"]='' ["110"]='' ["111"]='')

year_binary=${binary[$year]}
month_binary=${binary[$month]}
day_binary=${binary[$day]}

hour_binary=${binary[$hour]}
minute_binary=${binary[$minute]}
second_binary=${binary[$second]}

for ((i=0 ; i<6 ; i++)); do
    date_binary[$i]="${year_binary:$i:1}${month_binary:$i:1}${day_binary:$i:1}"
    time_binary[$i]="${hour_binary:$i:1}${minute_binary:$i:1}${second_binary:$i:1}"

    date_font="$date_font${font[${date_binary[$i]}]}"
    time_font="$time_font${font[${time_binary[$i]}]}"
done
echo " $time_font  $date_font"
