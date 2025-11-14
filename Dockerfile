FROM continuumio/miniconda3 

# install git
RUN apt-get update \
&& apt-get install -y --no-install-recommends git \
&& apt-get clean
RUN git clone https://github.com/jiananwu72/PointDefectsRL /repository

WORKDIR /repository
RUN conda env create -f environment.yml \
 && conda clean -afy
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "point_defects"]
CMD ["bash"]