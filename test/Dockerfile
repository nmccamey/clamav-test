FROM ubuntu:20.04

ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install -y tzdata

# Common modules that might need to be used. I am including cpanm in case there is not a
# debian package for something or we want to install a specific version.
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
        build-essential \
        vim \
        curl \
        wget \
        sudo \
        netcat

# RUN apt-get -y install net-tools iputils-ping clamdscan
RUN apt-get -y install clamdscan
COPY clamd-primary.conf /etc/clamav/clamd-primary.conf
COPY clamd-secondary.conf /etc/clamav/clamd-secondary.conf

# Install tini for applications that need it
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

# Add wait-for-it for applications that need it
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it

# Make both utilities runnable
RUN chmod +rx /tini /wait-for-it

RUN mkdir -p /code/

# Will standardize on the caledon user.
# All these args will be passed in via the shell script that will run the docker exec command
ARG USER=payroc
ARG PW=payroc
ARG UID=1000
ARG GID=1000

RUN useradd -m ${USER} -G sudo --uid=${UID} && echo "${USER}:${PW}" | \
      chpasswd
USER ${UID}:${GID}
WORKDIR /code/

ENTRYPOINT ["/tini", "--"]
CMD ["tail", "-f", "/dev/null"]

RUN echo "PS1='\u@clamav-utility-container:\w\$ '" >>~/.bashrc
