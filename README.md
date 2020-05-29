MRChem benchmark for hardware testing

Procedure
---------

1) Verify that the dependencies in `modules.txt` are available on the cluster
2) Download and build the code (requires internet connection)

```
    $ ./build.sh
```
3) Generate input files (all arguments required)
```
    $ ./generate <molecule> <nodes> <tasks-per-node> <cpus-per-task> <hours> <account>
```
4) Run calculation
```
    $ cd <molecule>
    $ sbatch mrchem.run
```

Recommended settings
--------------------

1) Caffeine: 10-26 MPI, 4-20 OMP
2) Valinomycine: 50-150 MPI, 4-20 OMP
