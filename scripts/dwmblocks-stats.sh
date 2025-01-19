#!/usr/bin/sh

GPU_STATS=$(nvidia-smi --query-gpu=utilization.gpu,utilization.memory --format=csv,noheader,nounits)

GPU_UTIL=$(cut -d ',' -f 1 <<< $GPU_STATS)
GPU_MEMO=$(cut -d ' ' -f 2 <<< $GPU_STATS)
CPU_UTIL=$(expr 100 - $(mpstat --dec=0 -o JSON | pcregrep -o '"idle": \d+' | cut -d ' ' -f 2))
MEM_UTIL=$(expr 100 '-' '(' $(grep -m 1 'MemAvailable:' '/proc/meminfo' | pcregrep -o '\d+') '*' 100 '/' $(grep -m 1 'MemTotal:' '/proc/meminfo' | pcregrep -o '\d+') ')')

printf "GPU: %d%% GMEM: %d%% CPU: %d%% MEM: %d%%\n" $GPU_UTIL $GPU_MEMO $CPU_UTIL $MEM_UTIL
