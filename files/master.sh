#!/bin/bash

PARSECDIR=/home/hl130/parsec-3.0/bin
OUTDIR=/home/hl130/parsec-3.0/output



#order
#1) run it and save output
#2) grep it
#3) fpaste it and save the link

ACTION=run
DATASET=native
SLEEP=10s

#APP

function run_experiment {

APP=$1
DATASET=$2

#S=20mb #cachesize
CORE=0x200 #core


for SIZE in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
do

#get hex representation
decimal=$(echo "2^"$SIZE"-1" | bc)
binary=$(echo "obase=2;$decimal" | bc)
hex=$(echo "obase=16;ibase=2;$binary" | bc)


#set the COS and core
#use COS 9 and core 9
sudo pqos -e "llc:9=0x"$hex";" 
sudo pqos -a "llc:9=9;"


S=""$SIZE"mb" #cachesize

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a "$ACTION" -p "$APP" -i "$DATASET" >> $OUTDIR/"$APP"/"$APP"_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links
sleep $SLEEP

done
} 


run_experiment blackscholes simlarge
