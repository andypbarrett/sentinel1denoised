#!/bin/bash

OUTPATH=/media/apbarret/andypbarrett_work/Data/ExtremeEarthPolar/Images/Denoised
#filelist=/media/apbarret/andypbarrett_work/Data/ExtremeEarthPolar/Images/Original/S1A_EW_GRDM_1SDH_20180116T075430_20180116T075530_020177_0226B9_9FE3.zip
filelist=`ls /media/apbarret/andypbarrett_work/Data/ExtremeEarthPolar/Images/Original/*.zip`

for fp in $filelist;
do
    fin=$(basename $fp)
    fout=$OUTPATH/${fin/.zip/.denoised.tif}
    echo "Processing $fp"
    echo "Writing to $fout"
    python -m s1denoise.scripts.s1_correction  $fp $fout
done
