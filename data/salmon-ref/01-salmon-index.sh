#! /usr/bin/env bash

#BSUB -J salmon-index
#BSUB -eo salmon-index.log
#BSUB -R "select[mem>50] rusage[mem=50]"

source activate salmon

salmon index \
    -t combined.fasta.gz \
    -i dmel-all-transcript-r6.48_index \
    --decoys decoys.txt \
    -k 31

