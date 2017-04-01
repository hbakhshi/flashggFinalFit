#!/bin/bash

INPUTDIR=/eos/user/g/gkrintir/thq/output/03_17_17/signals/
INPUTFILES=`ls -m $INPUTDIR/WS* | sed -e 's/, /,/g' | tr -d '\n'`
FILE=$INPUTFILES
echo "Files are $FILE"
#EXT="ws906id_withBBH"
EXT=${1}
echo "Ext is $EXT"
PROCS="thw,thq,tth,ggh,vbf,gghpre"
echo "Procs are $PROCS"
CATS="THQLeptonicTag"
echo "Cats are $CATS"
INTLUMI=35.9
echo "Intlumi is $INTLUMI"
# BATCH="IC"
# echo "Batch is $BATCH"
# QUEUE="hep.q"
# echo "Batch is $QUEUE"
BSWIDTH=3.400000
echo "Bswidth is $BSWIDTH"
NBINS=320
echo "Nbins is $NBINS"

SCALES="HighR9EB,HighR9EE,LowR9EB,LowR9EE" #,Gain1EB,Gain6EB"
SCALESCORR="MaterialCentral,MaterialForward,FNUFEE,FNUFEB,ShowerShapeHighR9EE,ShowerShapeHighR9EB,ShowerShapeLowR9EE,ShowerShapeLowR9EB"
SCALESGLOBAL="NonLinearity:UntaggedTag_0:2,Geant4"
SMEARS="HighR9EBPhi,HighR9EBRho,HighR9EEPhi,HighR9EERho,LowR9EBPhi,LowR9EBRho,LowR9EEPhi,LowR9EERho"

#MASSLIST="120,123,124,125,126,127,130"
MASSLIST="125"
MLOW=120
MHIGH=130
echo "Masslist is $MASSLIST"
#--batch $BATCH
./runSignalScripts.sh -i $FILE -p $PROCS -f $CATS --ext $EXT --intLumi $INTLUMI  --massList $MASSLIST --bs $BSWIDTH \
                        --smears $SMEARS --scales $SCALES --scalesCorr $SCALESCORR --scalesGlobal $SCALESGLOBAL --useSSF 1 --useDCB_1G 0
