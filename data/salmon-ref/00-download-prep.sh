#! /usr/bin/env bash

# The full salmon outputs are in:
# /beevol/home/jhessel/projects/rnabioco/reis-fly-fat-body/data/salmon-ref

wget http://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.48_FB2022_05/fasta/dmel-all-chromosome-r6.48.fasta.gz
wget http://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.48_FB2022_05/fasta/dmel-all-transcript-r6.48.fasta.gz

zgrep '^>' dmel-all-chromosome-r6.48.fasta.gz \
    | cut -f1 -d' ' \
    | sed 's/>//g' > decoys.txt

zcat dmel-* | gzip -c > combined.fasta.gz
