#!/bin/bash

PARSECDIR=/home/hl130/parsec-3.0/bin
OUTDIR=/home/hl130/parsec-3.0/output



#order
#1) run it and save output
#2) grep it
#3) fpaste it and save the link

#blackscholes


S=20mb #cachesize
CORE=0x8000 #core

#20mb
sudo taskset "$CORE" $PARSEDIR/parsecmgmt -a run -p blackscholes -i simsmall >> $OUTDIR/blackscholes/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/blackscholes/bs_"$S"_raw >> $OUTDIR/blackscholes/bs_"$S"
echo -e "blackscholes   "$S":  " >> $OUTDIR/blackscholes/links
fpaste $OUTDIR/blackscholes/bs_"$S" >> $OUTDIR/blackscholes/links
echo -e "\n" >> $OUTDIR/blackscholes/links



S=1mb #cachesize
CORE=0x400 #core
#1mb
sudo taskset "$CORE" $PARSEDIR/parsecmgmt -a run -p blackscholes -i simsmall >> $OUTDIR/blackscholes/bs_"$S"_raw
grep -E '^(IPC*|Total*)' $OUTDIR/blackscholes/bs_"$S"_raw >> $OUTDIR/blackscholes/bs_"$S"
echo -e "blackscholes   "$S":  " >> $OUTDIR/blackscholes/links
fpaste $OUTDIR/blackscholes/bs_"$S" >> $OUTDIR/blackscholes/links
echo -e "\n" >> $OUTDIR/blackscholes/links
