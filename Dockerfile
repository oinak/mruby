FROM ruby:2.5.1

LABEL maintainer="me@oinak.com"

ENV MRUBY_VERSION 1.4.1

ENV MRUBY_DOWNLOAD_SHA256 2469b1f3e3c97a34f8c3dca1bca9795f66d6b17c7be60ddfc1f3b502cdcbb400

ENV SOURCE_PATH /usr/src/mruby

RUN set -ex \
	&& buildDeps=' \
		gcc \
		bison \
	' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $buildDeps \
	&& rm -rf /var/lib/apt/lists/* \
  && wget -O mruby.tar.gz https://github.com/mruby/mruby/archive/${MRUBY_VERSION}.tar.gz \
  && echo "$MRUBY_DOWNLOAD_SHA256 *mruby.tar.gz" | sha256sum -c - \
  && mkdir -p ${SOURCE_PATH} \
  && tar -xzf mruby.tar.gz -C ${SOURCE_PATH} --strip-components=1 \
  && rm mruby.tar.gz \
	&& cd ${SOURCE_PATH} \
	&& ./minirake

ENV PATH $SOURCE_PATH/bin:$PATH

CMD ["mirb"]
