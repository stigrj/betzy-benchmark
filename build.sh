#!/bin/bash -l

mrchem_version="v1.0.0-alpha1"
mrchem_url="https://github.com/MRChemSoft/mrchem/archive/${mrchem_version}.tar.gz"

src_dir="mrchem_src"
build_dir="mrchem_build"
install_dir="mrchem_install"

echo "-- Setting up environment"
source modules.txt
mkdir -p venv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

echo "-- Downloading MRChem"
mkdir -p ${src_dir}
curl -Ls "${mrchem_url}" | tar -xz -C "${src_dir}" --strip-components=1
cd ${src_dir}
./setup --prefix="../${install_dir}" --omp --mpi --cxx=mpiicpc ../${build_dir}

echo "-- Building MRChem"
cd ../${build_dir}
make && ctest -L unit --output-on-failure && make install

exit 0
