#!/bin/bash
#SBATCH --job-name=example_trim.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=paa9@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#--------------------------------------------------------------------------------------------------------#
# This script runs trimmomatic v0.39 on paired end fastq files and directs output to sub directory "trim_out" #
#--------------------------------------------------------------------------------------------------------#

#---- load module command ----------------------------------------------------------------#
shopt -s expand_aliases
module load trimmomatic

#---- DEFINE VARIABLES WITH FILE LOCATIONS ---------------------------------------------#

adapters=/home/paa9/trimmomatic/TruSeq3-PE.fa

input_R1=/home/paa9/trimmomatic/input_files/EC-12_R1_001.fastq
input_R2=/home/paa9/trimmomatic/input_files/EC-12_R2_001.fastq

output_R1_PE=/home/paa9/trimmomatic/trim_output/EC-12_R1_001.trmPE.fastq
output_R1_SE=/home/paa9/trimmomatic/trim_output/EC-12_R1_001.trmSE.fastq

output_R2_PE=
output_R2_SE=

#-- run paired end mode -----------------------------------------------------------------#

trimmomatic PE \
$input_R1 \
$input_R2 \
$output_R1_PE $outupt_R1_SE \
$output_R2_PE $output_R2_SE \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

#----- unload module command -----------------------------------------------------#


#- FIN -----------------------------------------------------------------------#
