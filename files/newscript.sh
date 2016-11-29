#!/bin/bash

PARSECDIR=/home/hl130/parsec-3.0/bin
OUTDIR=/home/hl130/parsec-3.0/output



#order
#1) run it and save output
#2) grep it
#3) fpaste it and save the link

#blackscholes

APP=blackscholes
S=20mb #cachesize
CORE=0x8000 #core

sudo taskset "$CORE" /home/hl130/parsec-3.0/bin/parsecmgmt -a run -p "$APP" -i simsmall >> $OUTDIR/"$APP"/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/"$APP"/"$APP"_"$S"_raw >> $OUTDIR/"$APP"/"$APP"_"$S"
echo -e ""$APP"   "$S":  " >> $OUTDIR/links
sudo fpaste $OUTDIR/"$APP"/"$APP"_"$S" >> $OUTDIR/links
echo -e "\n" >> $OUTDIR/links
