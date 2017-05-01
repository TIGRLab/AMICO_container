# Singularity container for AMICO

A singularity container implementing the "linear framework for Accelerated Microstructure Imaging via Convex Optimization (AMICO)". Original implementation [here](https://github.com/daducci/AMICO).

~~*Currently based on a repo fork, due to a very minor change.*~~

# Usage:
`$singularity run amico.img -h`

Run scripts are setup to map paths relative to the singularity `/input` folder.
To map this folder to somewhere on your local file system, use the `-B` parameter.
Mappings can be overridden by providing absolute paths, however dependent on the
singularity setup local paths may not be available in the container.

`$singularity run -B <path_to_study_folder>:/input run amico.img . <subject_folder>`


# Dependencies:

## To run:
* [Singularity engine](http://singularity.lbl.gov/)

## To build:
* [Docker](https://www.docker.com)
* [Singularity engine](http://singularity.lbl.gov/)
