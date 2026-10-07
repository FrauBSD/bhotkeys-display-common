[//]: # ($FrauBSD: bhotkeys-display-common/README.md 2026-10-06 19:39:42 -0700 Devin Teske $)

# bhotkeys-display-common

Shared RandR subroutines for laptop, mirror, and extend layouts.
`display-laptop-only` turns external outputs off and leaves the
internal panel. `display-session-restore` replays the mode saved
in the previous session.

Home: [FrauBSD/bhotkeys-display-common](https://github.com/FrauBSD/bhotkeys-display-common)

## Build / install

```sh
make install    # PREFIX=/usr/local by default
```

Installs `display-randr-common.subr` into
`${PREFIX}/libexec/bhotkeys`. `display-laptop-only` and
`display-session-restore` go into `${PREFIX}/bin`.
