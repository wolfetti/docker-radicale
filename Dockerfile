ARG DISTRO=alpine:3.12
FROM $DISTRO

# python3 shared with most images
RUN apk add --no-cache \
    python3 py3-pip bash \
  && pip3 install --upgrade pip

# Image specific layers under this line
RUN apk add --no-cache curl \
 && pip3 install radicale~=3.0 \
 && pip3 install --upgrade https://github.com/Unrud/RadicaleIMAP/archive/master.tar.gz

COPY radicale.conf /default.conf

EXPOSE 5232/tcp
VOLUME ["/data"]

ADD ./start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT /start.sh

HEALTHCHECK CMD curl -f -L http://localhost:5232/ || exit 1
