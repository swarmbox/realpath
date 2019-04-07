# realpath - taken from FreeBSD for macOS

macOS is missing a command line utility named `realpath` that is found on most *nix's. This is small Xcode project that will grab the latest [code for realpath from FreeBSD](https://github.com/freebsd/freebsd/tree/master/bin/realpath), compile and install it locally on a macOS system.

## Requirements

- GNU Make 

## Install

To install:

```sh
git clone https://github.com/swarmbox/realpath.git
cd realpath
make
sudo make install
```

Installed files:

- `/usr/local/bin/realpath`
- `/usr/local/share/doc/realpath/LICENSE`
- `/usr/local/share/man/man1/realpath.1`

## Licenses

Both the source code for realpath taken directly, unmodified from the FreeBSD project and the other files in this project are licensed under the [FreeBSD License](https://github.com/swarmbox/realpath/blob/master/LICENSE).

## Acknowledgments

Um... just everyone over there at [FreeBSD](https://www.freebsd.org) for the awesome work that they do.
