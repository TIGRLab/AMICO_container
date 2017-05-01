From ubuntu:yakkety
Label maintainer "Thomas.Wright"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python \
    python-pip \
    git \
    python-dipy \
    curl \
    wget \
    vim-tiny \
    libblas-dev \
    liblapack-dev \
    software-properties-common \
    python-software-properties \
    build-essential \
    python-dev \
    python-setuptools


  # configure git
  RUN git config --global url."https://".insteadOf git://

  WORKDIR /opt
  RUN wget http://spams-devel.gforge.inria.fr/hitcounter2.php?file=file/36740/spams-python-v2.6-2017-04-18.tar.gz -O spams-python.tar.gz
  RUN tar -xzf spams-python.tar.gz
  RUN rm spams-python.tar.gz

  WORKDIR /opt/spams-python
  RUN python setup.py install

  # install Oracle JAVA
  WORKDIR /opt
  #RUN add-apt-repository ppa:webupd8team/java
  RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      default-jdk \
      default-jre

  # install camino
  ENV CAMINO_HEAP_SIZE=1800
  RUN git clone git://git.code.sf.net/p/camino/code camino
  WORKDIR /opt/camino
  RUN make
  ENV PATH=${PATH}:/opt/camino/bin

  # install Amico
  WORKDIR /opt
  RUN git clone https://github.com/daducci/AMICO.git
  WORKDIR /opt/AMICO
  RUN pip install .

  RUN rm -rf /var/lib/apt/lists
