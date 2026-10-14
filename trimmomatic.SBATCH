#!/bin/bash
#SBATCH --job-name=trimmomatic.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=paa9@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#--------------------------------------------------------------------------------------------------------#
# This script runs trimmomatic v0.39 on paired end fastq files and directs output to sub directory "trim_out" #
#--------------------------------------------------------------------------------------------------------#

#---- load module command ----------------------------------------------------------------#
shopt -s expand_aliases
module load trimmomatic

#-- run paired end mode -----------------------------------------------------------------#

trimmomatic PE \
EC-12_R1_001.fastq.gz \
EC-12_R2_001.fastq.gz \
EC-12_R1_pairedend.fq.gz EC-12_R1_singleend.fq.gz \
EC-12_R2_pairedend.fq.gz EC-12_R2_singleend.fq.gz \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

#----- unload module command -----------------------------------------------------#
module unload trimmomatic

#- FIN -----------------------------------------------------------------------#
