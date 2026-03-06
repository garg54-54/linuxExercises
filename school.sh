#!/bin/bash

cat Property_Tax_Roll.csv \
| grep "MADISON SCHOOLS" \
| cut -d',' -f7 \
| {
    sum=0
    count=0
    while read value
    do
        sum=$((sum + value))
        count=$((count + 1))
    done

    if [ $count -gt 0 ]; then
        echo $((sum / count))
    else
        echo 0
    fi
}
