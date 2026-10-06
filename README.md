[//]: # ($FrauBSD: bhotkeys-display-common/README.md 2026-10-05 21:46:53 -0700 Devin Teske $)

# bhotkeys-display-common

Shared RandR subroutines for laptop, mirror, and extend layouts.
`display-laptop-only` turns external outputs off and leaves the
internal panel.

Home: [FrauBSD/bhotkeys-display-common](https://github.com/FrauBSD/bhotkeys-display-common)

## Build / install

```sh
make install    # PREFIX=/usr/local by default
```

Installs `display-randr-common.subr` into
`${PREFIX}/libexec/bhotkeys`, and `display-laptop-only` into
`${PREFIX}/bin`.
