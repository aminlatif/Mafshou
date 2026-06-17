ARG ENVIRONMENT_MODE=production
FROM dhi.io/rust:1.96-alpine-dev

ARG TIMEZONE=UTC
ARG USER_ID=1000
ARG GROUP_ID=1000

USER root

RUN apk add --no-cache tzdata openssl openssl-dev openssl-libs-static pkgconfig

RUN ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
RUN echo ${TIMEZONE} > /etc/timezone

RUN addgroup -g ${GROUP_ID} mafshou
RUN adduser -D -u ${USER_ID} -G mafshou mafshou
RUN mkdir -p /src
RUN chown -R mafshou:mafshou /src

WORKDIR /src
USER mafshou

RUN cargo install sqlx-cli
RUN cargo install cargo-watch

# ENTRYPOINT ["tail"]
# CMD ["-f","/dev/null"]
CMD ["cargo", "watch", "-x", "run"]
# CMD ["cargo", "run"]
