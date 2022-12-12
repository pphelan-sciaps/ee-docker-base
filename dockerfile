## base image
FROM ubuntu:20.04

## base image tools
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential git

## python
# default version
ENV PY_VERSION 3.10.8

# build dependancies
RUN apt-get install -y libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN set -ex \
    && curl https://pyenv.run | bash \
    && pyenv update \
    && pyenv install $PYTHON_VERSION \
    && pyenv global $PYTHON_VERSION \
    && pyenv rehash