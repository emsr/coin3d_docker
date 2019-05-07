FROM rsggitlab.alionscience.com/esmith-rowland/gcc9-cmake

WORKDIR /coin3d/

RUN \
  apt update; \
  apt install -y \
    apt-utils \
    libboost-all-dev \
    graphviz \
    doxygen \
    mercurial \
    qt5-default \
    qt3d5-dev \
    libqt5sql5-psql libqt5sql5-sqlite;

RUN \
  hg clone https://bitbucket.org/Coin3D/simage; \
  mkdir simage_build; \
  cd simage_build; \
  cmake ../simage -G"Unix Makefiles"; \
  make; \
  make install; \
  cd ..; \
  hg clone https://bitbucket.org/Coin3D/coin; \
  mkdir coin_build; \
  cd coin_build; \
  cmake ../coin -G"Unix Makefiles"; \
  make; \
  make install; \
  cd ..; \
  hg clone https://bitbucket.org/Coin3D/soqt; \
  mkdir soqt_build; \
  cd soqt_build; \
  cmake ../soqt -G"Unix Makefiles"; \
  make; \
  make install; \
  cd ..;
