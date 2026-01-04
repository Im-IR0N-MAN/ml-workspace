FROM continuumio/miniconda3

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

COPY environment.yml .

RUN conda env create -f environment.yml && conda clean -afy

#(Not using this as this wraps jupyter logs in buffer )
#Ensure all future commands run inside the conda env
#SHELL ["conda", "run", "-n", "ml-env", "/bin/bash", "-c"]

ENV PATH /opt/conda/envs/ml-env/bin:$PATH

COPY . .

EXPOSE 8888

#CMD ["conda", "run", "-n", "ml-env", "jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]