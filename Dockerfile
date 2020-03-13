FROM    amazonlinux:2-with-sources

RUN     yum update -y
RUN     yum groupinstall "Development Tools" -y
RUN     yum install -y \
        gcc \
        bzip2-devel \
        libffi \
        openssl-devel \
        perl-core \
        zlib-devel \
        libxml2-devel \
        libxslt-devel \
        libffi-devel \
        libcffi-devel \
        wget

ENV     PYTHON_VERSION 3.8.2

RUN     cd /usr/src/ && \
        wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz && \
        tar xzf Python-$PYTHON_VERSION.tgz && \
        cd Python-$PYTHON_VERSION && \
        ./configure --enable-optimizations && \
        make altinstall && \
        cd / && rm -rf /usr/src/Python-$PYTHON_VERSION.tgz && python3.8 -V

RUN     yum install -y gcc-c++ make \
        && curl -sL https://rpm.nodesource.com/setup_13.x | bash \
        && yum install -y nodejs
