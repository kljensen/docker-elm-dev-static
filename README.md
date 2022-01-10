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
[@maggisk/elm-without-npm](https://github.com/maggisk/elm-without-npm).

## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
