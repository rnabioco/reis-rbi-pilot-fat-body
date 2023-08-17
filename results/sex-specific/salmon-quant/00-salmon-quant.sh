#! /usr/bin/env bash

#BSUB -J salmon-quant[1-12]
#BSUB -eo logs/salmon-quant.%J.%I.log
#BSUB -R "select[mem>16] rusage[mem=16]"

# The full salmon outputs are in:
# /beevol/home/jhessel/projects/rnabioco/reis-fly-fat-body/results

set -o nounset -o pipefail -o errexit -x

samples=(
    FemaleFB_1 FemaleFB_2 FemaleFB_3
    MaleFB_1 MaleFB_2 MaleFB_3)

sample=${samples[$(($LSB_JOBINDEX - 1))]}

data="/beevol/home/rbilab/data/reis/raw_data/220218_A00405_0531_BH352HDRX2"
project=$HOME/projects/rnabioco/reis-fly-fat-body
index=$project/data/ref/dmel-all-transcript-r6.48_index

fq1=$(ls $data/*$sample*R1*.fastq.gz)
fq2=$(ls $data/*$sample*R2*.fastq.gz)

salmon quant -i $index -l IU -1 $fq1 -2 $fq2 -o "$sample""_out"
