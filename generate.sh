#!/bin/bash -l

mol=$1
nodes=$2
tasks_per_node=$3
cpus_per_task=$4
hours=$5
account=$6

world_size=6
world_prec=4
angstrom=true
method="LDA"
kain=5
max_iter=100
localize=true
guess_type="sad_dz"
guess_prec=3
orbital_thrs=2
checkpoint=false

echo "molecule" $mol
mkdir -p $mol
cd $mol

cp ../template.inp                           mrchem.inp
sed -i "/coords/r ../molecules/${mol}.xyz"   mrchem.inp
sed -i "s/WORLD_PREC/${world_prec}/"         mrchem.inp
sed -i "s/WORLD_SIZE/${world_size}/"         mrchem.inp
sed -i "s/ANGSTROM/${angstrom}/"             mrchem.inp
sed -i "s/METHOD/${method}/"                 mrchem.inp
sed -i "s/KAIN/${kain}/"                     mrchem.inp
sed -i "s/MAX_ITER/${max_iter}/"             mrchem.inp
sed -i "s/LOCALIZE/${localize}/"             mrchem.inp
sed -i "s/ORB_THRS/${orbital_thrs}/"         mrchem.inp
sed -i "s/GUESS_TYPE/${guess_type}/"         mrchem.inp
sed -i "s/GUESS_PREC/${guess_prec}/"         mrchem.inp
sed -i "s/CHECKPOINT/${checkpoint}/"         mrchem.inp

cp ../template.run                           mrchem.run
sed -i "s/NAME/${mol}/"                      mrchem.run
sed -i "s/NODES/${nodes}/"                   mrchem.run
sed -i "s/TASKS/${tasks_per_node}/"          mrchem.run
sed -i "s/CPUS/${cpus_per_task}/"            mrchem.run
sed -i "s/HOURS/${hours}/"                   mrchem.run
sed -i "s/ACCOUNT/${account}/"               mrchem.run

