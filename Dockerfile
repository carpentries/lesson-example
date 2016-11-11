FROM debian:testing

MAINTAINER Raniere Silva

RUN apt-get -y update && apt-get -y install curl r-base r-base-dev
RUN curl https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh -o Anaconda3-4.2.0-Linux-x86_64.sh && bash Anaconda3-4.2.0-Linux-x86_64.sh -b
RUN apt-get -y install ruby ruby-dev && yes | gem install jekyll
RUN apt-get -y install make

RUN Rscript -e "update.packages(ask = FALSE, repos = 'http://cran.rstudio.org')"
RUN Rscript -e "install.packages('knitr', repos = c('http://rforge.net', 'http://cran.rstudio.org'), type = 'source')"
RUN Rscript -e "install.packages('checkpoint', repos = c('http://rforge.net', 'http://cran.rstudio.org'), type = 'source')"
RUN Rscript -e "install.packages('ggplot2', repos = c('http://rforge.net', 'http://cran.rstudio.org'), type = 'source')"

VOLUME /carpentry

WORKDIR /carpentry

# Port to expose
EXPOSE 4000

CMD ["make", "serve"]
