FROM ruby:2.5-alpine3.7

RUN apk update
RUN apk add --no-cache bash nodejs tzdata less sqlite-dev sqlite-libs
RUN apk add --no-cache alpine-sdk \
      --virtual .build_deps libxml2-dev libxslt-dev zlib zlib-dev readline-dev

ENV BUNDLE_PATH /bundle
ENV BUNDLE_DISABLE_SHARED_GEMS 1

RUN echo -e 'install: --no-document\nupdate: --no-document' >> ~/.gemrc
RUN gem install bundler
RUN gem install rails -v '~>5.2.0'

WORKDIR /var/myapp

CMD sh
