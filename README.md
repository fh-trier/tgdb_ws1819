# Tutorium Grundlagen Datenbanken WS1819

[![Build Status](https://drone.cryptic.systems/api/badges/fh-trier/tgdb_ws1819/status.svg)](https://drone.cryptic.systems/fh-trier/tgdb_ws1819)

This document contains all tasks for the tutorial basics databases winter
semester 2018/2019 of the University of Applied Sciences Trier.

Discussions and questions can be posted via the Telegram group
[tgdb_ws1819](https://t.me/joinchat/IUajBBnIt1yQ9Tju). Announcements of changes
to the document are also published there.

## Build

The outcoming document is a pdf file. The pdf file can be compiled with latex.
Latex is available for multiple operation systems. Instead to download and
install all required libraries to compile the document, it is easier to use the
provided container image which is also used to compile the pdf document inside
the CI/CD pipeline. Therefore can be used two different commands to compile the
pdf document.

Compile the pdf document inside a container image. A container runtime such as
docker must be available.

> The container runtime can be changed inside the `Makefile`

```bash
make container-run/index.pdf
```

Alternatively can also the local installed latex binaries used when all
dependencies are fulfilled.

```bash
make index.pdf
```

## SQL

The database scheme can be imported via the Makefile. The required database
connection string will be concatenated from the environment variables `DB_USER`,
`DB_PASSWD` and `DB_HOST`.

The command `make db/import-model` imports the complete scheme into the
database. The solutions, defined in the separate files will be executed by `make
execute-solutions`. The third command is `make db delete-scheme` to delete the
complete scheme.

Sometimes you don't want to run all solutions, but only those from a directory.
The FOLDER environment variable can be used to execute the directory with the
solutions it contains, for example `make execute-solutions FOLDER=uebung_05`.
