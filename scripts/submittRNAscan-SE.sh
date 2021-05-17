#!/bin/bash

#PBS -q workq
#PBS -l select=1:ncpus=5 
#PBS -V
#PBS -J 0-1:1

cd ${PBS_O_WORKDIR} 

infile=`ls -1 /strg1/groups/GENCLIMA/Vellozia/ncRNA/genomes/Vellozia/Vintermedia/*.fasta | head -n ${PBS_ARRAY_INDEX} | tail -n1`

time tRNAscan-SE -o Vintermedia.trnas -m Vintermedia.stats ${infile}
