FROM ghcr.io/kljensen/docker-grass-sass@sha256:0d83e2f61cd79c38de12a342ff3dbc36433a260e8a90c2500b17ee19ec6d289e as grass
FROM alpine:3.15.0 as builder



WORKDIR "/app"

ENV ELM_VERSION=0.19.1 \
    ELM_FORMAT_VERSION=0.8.5 \
    ESBUILD_VERSION=0.14.11 \
    SASS_VERSION=1.47.0

RUN apk add --no-cache curl libc6-compat upx binutils

# Elm: https://elm-lang.org
RUN curl -L "https://github.com/elm/compiler/releases/download/$ELM_VERSION/binary-for-linux-64-bit.gz" \
    | gunzip > /usr/local/bin/elm \
    && chmod +x /usr/local/bin/elm \
    && strip /usr/local/bin/elm \
    && upx --best --lzma /usr/local/bin/elm


# elm-format: https://github.com/avh4/elm-format
RUN curl -L "https://github.com/avh4/elm-format/releases/download/$ELM_FORMAT_VERSION/elm-format-$ELM_FORMAT_VERSION-linux-x64.tgz" \
    | tar xzO > /usr/local/bin/elm-format \
    && chmod +x /usr/local/bin/elm-format \
    && strip /usr/local/bin/elm-format \
    && upx --best --lzma /usr/local/bin/elm-format

# esbuild: https://github.com/evanw/esbuild
RUN curl -L "https://registry.npmjs.org/esbuild-linux-64/-/esbuild-linux-64-$ESBUILD_VERSION.tgz" \
    | tar xzO > /usr/local/bin/esbuild \
    && chmod +x /usr/local/bin/esbuild \
    && strip /usr/local/bin/esbuild \
    && upx --best --lzma /usr/local/bin/esbuild

FROM scratch
COPY --from=grass /usr/local/bin/grass /usr/local/bin/grass
COPY --from=builder /usr/local/bin/elm /usr/local/bin/elm
COPY --from=builder /usr/local/bin/elm-format /usr/local/bin/elm-format
COPY --from=builder /usr/local/bin/esbuild /usr/local/bin/esbuild