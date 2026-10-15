#!/bin/bash
#SBATCH --job-name=blast_search --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=paa9@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#-----------------------------------------------------------------------------#
# This script blasts against our custom databases                             #
#-----------------------------------------------------------------------------#

module load blast


# Location of the query
loc_query="/home/paa9/albo_2020_genome/blast/mara_insert_flanking.fa.txt"

# Location of the databases
loc_db="/home/paa9/albo_2020_genome/aedes_albopictus_LA_20200616.fa"

# Location of the output results
loc_output="/home/paa9/albo_2020_genome/blast/mara_insert_flanking.output"

#- RUN BLASTN ----------------------------------------------------------------#

blastn -query $loc_query \
-num_descriptions 50 -num_alignments 10 \
-db $loc_db \
-out $loc_output

#- FIN -----------------------------------------------------------------------#
