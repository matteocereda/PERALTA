# ======================================
# LOGIN AND AUTH 
# ======================================

ssh user@172.27.0.60

# Monitoting jobs ======================
qstat -q # shows queue
qstat -f # shows full information. Usefull to monitor PSB env.variables
qstat -ans1 # showd all queues/jobs, hosts, comments

# ======================================
# Interactive sessions 
# ======================================

qsub -I 
qsub -I -l select=1:ncpus=10 
qsub -I -q interactive -l select=1:ncpus=10  

# ======================================
# RUNNING jobs
# ======================================
# be aware that 
qsub -l select=1:ncpus=10 -q workq prova.sh
qsub -l select=1:ncpus=10 -q workq -o ./logs/ -j oe prova.sh

# Hold a job until another one has finished with success:
qsub -W depend=afterok:JOBID script.sh

# to save logs within a single file use tee
# <comando> | tee -a file_di_log.txt 2>&1
# <comando> | tee file_di_log_${PBS_JOBID}.txt 2>&1

## ---cat prova.sh ----
#cd $PBS_O_WORKDIR
#/hpcnfs/software/bcl2fastq2/bin/bcl2fastq --no-lane-splitting --barcode-mismatches 0 -p 28 -r 28 -w 28
## ---------------------

# MOVE jobs to other queues ============
qmove


# ======================================
# CONDA
# ======================================
# Some software are unde conda. 
conda update -n base conda

# *** Be aware of the VERSION ***
source /hpcnfs/software/anaconda/anaconda3/etc/profile.d/conda.sh

# initialize conda
conda init bash 

conda info --envs

conda list

conda create -p /hpcnfs/data/cgb/conda_envs/genomics multiqc 

conda create -n genomics multiqc 

# ======================================
# SINGULARITY
# ======================================
module load singularity doit-scripts
