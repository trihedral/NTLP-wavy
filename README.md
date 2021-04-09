# NTLP-wavy

To install this project on an ND CRC server, navigate to the desired location
in a terminal and run the following commands:

```shell
git clone https://www.github.com/trihedral/NTLP-wavy  
cd NTLP-wavy/build  
module load intel  
module load mvapich2  
module load netcdf  
make  
```

You can use the copyRun script to create new runs based on the files and
parameters of an old run.  The script automatically updates locations in
params.in and the job name in les.run.  The command syntax is:  
```shell
./copyRun oldRun newRun  
```

For example, to start setting up your first run, try:  
```shell
./copyRun ExRun_Mono run1  
```

Finally, navigate to the newly created run1 directory and queue the run with:  
```shell
cd run1  
./les.run  
```

The les.run script will create a matching set of directories in your scratch365
drive.  This is where you will find the simulation output files.  
