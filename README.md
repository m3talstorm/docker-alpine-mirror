Alpine Linux Package Mirror - Docker Image
==========================================

:whale: A Docker stack which builds and runs an Alpine Linux package repository, for either mirroring the official repositories or to host private packages locally.

Based on the [offical guide](http://wiki.alpinelinux.org/wiki/How_to_setup_a_Alpine_Linux_mirror)

To configure alpine to use your new package mirror see [office docs](http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)

---

#### Building:

```
make build
```

### Running:

To run the repository as well as a companion rsync server that automatically mirrors the official packages locally, run `docker-compose up -d` as normal.

#### Notes:

This will create and use a 'packages' directory in the folder you run the `docker-compose up` from, this will contain the directory tree and all the mirrored packages.

Furthermore, only the v3.7 branch and x86_64 architecture is mirrored currently, everything else is excluded to save on bandwidth/storage space. This can be changed inside of `rsync/exclude.txt`

The `rsync` service can be removed from the `docker-compose.yml` if you only want to host private repos and not use this as a mirror.
