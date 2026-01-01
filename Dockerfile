FROM continuumio/miniconda3

WORKDIR /app

COPY environment.yml .

RUN conda env create -f environment.yml && conda clean -afy

# Ensure all future commands run inside the conda env
SHELL ["conda", "run", "-n", "${ENV_NAME}", "/bin/bash", "-c"]

COPY . .

EXPOSE 8888

CMD ["conda", "run", "-n", "ml-env", "jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]