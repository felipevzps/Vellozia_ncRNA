#!/bin/bash

#PBS -q workq
#PBS -l select=1:ncpus=5 
#PBS -V
#PBS -J 0-1:1

cd ${PBS_O_WORKDIR} 

infile=`ls -1 *.fasta | head -n ${PBS_ARRAY_INDEX} | tail -n1`
clanin=`ls -1 /strg1/groups/GENCLIMA/Vellozia/ncRNA/src/ftp.ebi.ac.uk/pub/databases/Rfam/14.5/Rfam.clanin`
Rfamcm=`ls -1 /strg1/groups/GENCLIMA/Vellozia/ncRNA/src/ftp.ebi.ac.uk/pub/databases/Rfam/14.5/Rfam.cm`
 
time cmscan -Z 946.646526 --nohmmonly --rfam --cut_ga --fmt 2 --oclan --oskip --clanin ${clanin} -o Vintermedia.cmscan.out --tblout Vintermedia.cmscan.tblout $Rfamcm ${infile}
