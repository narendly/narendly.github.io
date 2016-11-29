#!/bin/bash

PARSECDIR=/home/hl130/parsec-3.0/bin
OUTDIR=/home/hl130/parsec-3.0/output



#order
#1) run it and save output
#2) grep it
#3) fpaste it and save the link

#blackscholes


ACTION=run
DATASET=native

APP=blackscholes
S=20mb #cachesize
CORE=0x8000 #core

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a "$ACTION" -p "$APP" -i "$DATASET" >> $OUTDIR/"$APP"/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links



S=19mb #cachesize
CORE=0x4000 #core

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a "$ACTION" -p "$APP" -i "$DATASET" >> $OUTDIR/"$APP"/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links



S=15mb #cachesize
CORE=0x2000 #core

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a "$ACTION" -p "$APP" -i "$DATASET" >> $OUTDIR/"$APP"/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links



S=10mb #cachesize
CORE=0x1000 #core

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a "$ACTION" -p "$APP" -i "$DATASET" >> $OUTDIR/"$APP"/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links



S=5mb #cachesize
CORE=0x800 #core

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a "$ACTION" -p "$APP" -i "$DATASET" >> $OUTDIR/"$APP"/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links



S=1mb #cachesize
CORE=0x400 #core

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a "$ACTION" -p "$APP" -i "$DATASET" >> $OUTDIR/"$APP"/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links

