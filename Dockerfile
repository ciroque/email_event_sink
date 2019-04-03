FROM elixir:1.8-alpine AS BOB_THE_BUILDER

ARG MIX_ENV=prod

ENV MIX_ENV=${MIX_ENV}

WORKDIR /opt/app

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache build-base

RUN mix local.rebar --force && \
    mix local.hex --force

COPY . .

RUN mix do deps.get, deps.compile, compile

RUN mkdir -p /opt/app/built && \
    mix release --verbose && \
    cp _build/prod/rel/email_event_sink/releases/0.1.0/email_event_sink.tar.gz /opt/app/built

## Now, build the actual release image

FROM alpine:3.9

RUN apk add --no-cache bash openssl

RUN mkdir -p /opt/app/email_event_sink

WORKDIR /opt/app/email_event_sink

COPY --from=BOB_THE_BUILDER /opt/app/built/email_event_sink.tar.gz .

RUN tar zxf email_event_sink.tar.gz && \
    rm email_event_sink.tar.gz

EXPOSE 4000
ENV PORT=4000 \
  MIX_ENV=prod \
  REPLACE_OS_VARS=true \
  SHELL=/bin/sh

ENTRYPOINT ["/opt/app/email_event_sink/bin/email_event_sink"]
CMD ["foreground"]