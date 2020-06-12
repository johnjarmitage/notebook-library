# this might be a good catch all image to use?

FROM jupyter/scipy-notebook:76402a27fd13

# below comes from here: https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html#preparing-your-dockerfile



COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# then we do a conda install of pyvista and depenencies

RUN conda update -n base conda

RUN conda install --quiet --yes -c conda-forge --file environment.txt

