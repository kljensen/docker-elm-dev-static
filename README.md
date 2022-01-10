# Elm-related static binaries in a Docker image

These are statically-linked binaries for

* [elm](https://github.com/elm/compiler),
* [elm-format](https://github.com/avh4/elm-format),
* [esbuild](https://github.com/evanw/esbuild), and
* [grass](https://github.com/connorskees/grass).

I use this for a minimal web development image.  Want to use it?

```
docker pull ghcr.io/kljensen/docker-elm-static:latest
```

All the binaries are linked against [musl](https://www.musl-libc.org/)
and are in `/usr/local/bin`. They're about 10MB in size total. You
can see the versions of everything in the Dockerfile.

My inspiration (and some of the code 🤣) for this came from
[@maggisk/elm-without-npm)](https://github.com/maggisk/elm-without-npm).
