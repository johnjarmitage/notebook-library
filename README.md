# Repository to explore making a Docker image of to host different notebooks

Explore how to host different notebooks within one docker image, and avoid the environment file becoming very large.

## Links

https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html#preparing-your-dockerfile
https://discourse.jupyter.org/t/allow-for-multiple-different-dependencies-per-repository/4109


## Docker:

I created a Dockerfile that uses the `jupyter/scipy-notebook` image and then adds the dependencies for `pyvista` as a typical SWUNG dependency.

The notebook is put into a folder `notebooks` in the root of the image as I am trying to use this to make a hub.

```
docker build -t notebook-library:1.1 .
docker run -d -p 127.0.0.1:8888:8888 --name notebook notebook-library:1.1
docker logs --tail 3 notebook
```

This gives you the URL to open the notebook server locally. I set port forwarding to port 8888 to match the output from the notebook server into the log.

## Notebooks

To get to the notebooks from the docker container you need to switch to using the lab interface `/lab` and then using the terminal copy the contents of `/notebooks` to the home directory `/home/work/`.