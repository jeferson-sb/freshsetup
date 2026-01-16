## Installation

### Requirements
- make
- git
- python

```sh
git clone https://github.com/jeferson-sb/freshsetup.git
cd freshsetup
cd scripts && sudo chmod -R +x *.sh && cd ..
```

### Dotfiles

```sh
make dotfiles
```

### Apps (manjaro)

```sh
make install-apps/arch
```

### Install packages

This will install development tools, zsh, languages, and much more.

```sh
make install/ubuntu
```

or

```sh
make install/arch
```

or

```sh
make install/macos
```

or

```sh
make install/fedora
```
