# CircleCI Orbs for OpenNMS

This repository is for CircleCI orbs to simplify automating various
OpenNMS builds.

Currently there is 1 orb: `sign-packages`, which can be used to
sign RPM and Debian packages.

## `sign-packages`

Before you can use the `sign-packages` orb, you must first add
CircleCI environment variables to your build.

### `GPG_SECRET_KEY`

Create the `GPG_SECRET_KEY` variable with the output of the following
command:

```shell
gpg --export-secret-key <your-key-id> | base64
```

### `GPG_PASSPHRASE`

Create the `GPG_PASSPHRASE` variable by running `base64` with no
arguments, then typing your GPG pass phrase, and when you're done
hit `CTRL+D`.  This avoids putting your pass phrase into your
shell command history.

If your GPG key does not have a pass phrase, this variable is
optional.
