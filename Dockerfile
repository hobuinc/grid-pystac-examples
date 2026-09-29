FROM condaforge/mambaforge

# 1. copy in files from dir
ADD ./ /var/task
WORKDIR /var/task
# 2. install dependencies with micromamba
RUN mamba env update -n base -f env.yaml
# 3. run init script
# SHELL ["mamba", "run", "-n", "grid-stac"]
RUN scripts/init
# 4. entrypoint jupyter lite serve
CMD ["jupyter", "lite", "serve", "--wheels", "/wheels"]
# 5. exit port 8000, map to something else?