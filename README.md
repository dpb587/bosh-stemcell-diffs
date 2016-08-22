# bosh-stemcell-metadata

For generating metadata about [BOSH](https://bosh.io) stemcells.


## Example

    # clone+cd
    host$ git clone https://github.com/dpb587/bosh-stemcell-metadata.git && cd bosh-stemcell-metadata

    # temporary workspace
    $ workspace=~/tmp/bosh-stemcell-metadata
    $ mkdir -p $workspace/{stemcell,results}

    # download a heavy stemcell
    $ wget -O $workspace/stemcell/tarball.tgz https://d26ekeud912fhb.cloudfront.net/bosh-stemcell/aws/bosh-stemcell-3202-aws-xen-ubuntu-trusty-go_agent.tgz

    # analyze
    $ ./example/docker-run $workspace/{stemcell,results}

    # review
    $ less $workspace/packages


## Analyzers

 * `filelist` - lists all files in the filesystem including md5 checksum, permissions, ownership, names, and targets
 * `manifest` - extracts the `stemcell.MF`
 * `md5` - generates the md5 of the tarball
 * `packages` - extracts the `stemcell_dpkg_l.txt` or `stemcell_rpm_qa.txt` package list file
 * `sha1` - generates the sha1 of the tarball


## License

[MIT License](./LICENSE)
