FROM alpine:3.9 AS build

RUN apk add git make alpine-sdk gcc libpng-dev jpeg-dev giflib-dev glib-dev perl

RUN git clone https://github.com/schani/metapixel.git

WORKDIR /metapixel

RUN git submodule update --init

RUN mkdir /usr/share/xml/docbook/stylesheet
RUN ln -s /usr/share/xml/docbook/xsl-stylesheets-1.79.1 /usr/share/xml/docbook/stylesheet/docbook-xsl

RUN make
RUN make install

COPY raw/avatars/ /default-library/
COPY generate.sh /

RUN chmod +x /generate.sh

VOLUME /data/

CMD ["/generate.sh"]
ENTRYPOINT ["/generate.sh"]
