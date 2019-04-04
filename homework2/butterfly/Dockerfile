FROM ubuntu:14.04.4

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
 	dialog \
	apt-utils \
	python-pip

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
	build-essential \
    libffi-dev \
    libssl-dev \
    python-dev \
    python-setuptools \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/* \
 && pip install virtualenv --upgrade \
 && pip install setuptools --upgrade \
 && pip install tornado==4.4.1

WORKDIR /opt
ADD . /opt/app
WORKDIR /opt/app

RUN python setup.py build \
 && python setup.py install

ADD docker/run.sh /opt/run.sh
#ADD pywumpus/pywumpus.py /opt/pywumpus.py
EXPOSE 57575

CMD ["butterfly.server.py", "--unsecure", "--host=0.0.0.0"]
ENTRYPOINT ["docker/run.sh"]
#CMD ["python3", "pywumpus/pywumpus.py"]
