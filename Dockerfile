# this might be a good catch all image to use?

FROM jupyter/scipy-notebook:76402a27fd13

# below comes from here: https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html#preparing-your-dockerfile
# put the notebooks in the directory tmp for future use as an image for a jupterhub

USER root
RUN mkdir /notebooks
COPY notebooks/* /notebooks/.
COPY environment.txt ${HOME}
RUN chown -R ${NB_UID} ${HOME}
RUN chown -R ${NB_UID} /notebooks
USER ${NB_USER}

# then we do a conda install of pyvista and depenencies

RUN conda update -n base conda
RUN conda install --quiet --yes -c conda-forge --file environment.txt

