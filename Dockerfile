FROM python:latest

ENV PYTHONUNBUFFERED=1

WORKDIR /usr/local

COPY bin/requirements.txt ./

RUN pip install -r requirements.txt

COPY bin/ ./

RUN apt-get install -y tar \
  && for f in `ls *xz`; do tar -xf $f; done \
  && rm -f *xz
