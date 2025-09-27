#!/bin/bash

#date=$(date)

start_time=$(date +%s)

sleep 20

end_time=$(date +%s)

total_time=$((end_time-start_time))

echo "total time taken to execute this script is: $total_time"