# TITLE
#
# docker build --rm -t spav/dep-hell .
#
# VERSION 0.1

FROM continuumio/anaconda
#FROM continuumio/anaconda:2.3.0

MAINTAINER Steven E. Pav, steven@gilgamath.com

ENV DOCKFILE_REFRESHED_AT 2017.06.21

RUN (conda install -c r r-base=3.2.2)
#RUN (conda update conda; \
	#conda update --all; \
	#conda install -c r r-essentials )

# see http://crosbymichael.com/dockerfile-best-practices.html
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
#RUN apt-get update
#RUN apt-get upgrade -y

RUN mkdir -p /opt;
WORKDIR /opt
ADD .Rprofile /opt/
ADD lockfile.yml /opt/

#RUN (conda install -c tsnyder gnumake=4.2)
# 3.8 would be more appropriate.
#RUN (conda install -c conda-forge make=4.2.1)

#RUN (conda install -c anaconda gcc=4.8.5)
#RUN (conda install -c anaconda gcc)

RUN (conda install -c anaconda gcc ; \
	conda install -c conda-forge make=4.2.1)

# always use array syntax:
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["R"]
# ENTRYPOINT and CMD are better together:
#CMD ["hi"]

#for vim modeline: (do not edit)
# vim:nu:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:syn=Dockerfile:ft=Dockerfile:fo=croql
