# bosh-stemcell-diffs

Help audit and compare changes in stemcell versions.


## Usage

    # clone+cd
    host$ git clone https://github.com/dpb587/bosh-stemcell-diffs.git && cd bosh-stemcell-diffs
    
    # build+start the docker container
    host$ ./bin/build && ./bin/run
    
    # generate metadata
    container$ ./bin/metadata aws xen ubuntu trusty 3202
    ==> downloading stemcell
    ==> mounting image
    ==> collecting metadata
    --> filelist
    --> manifest
    --> md5
    --> packages
    --> sha1
    ==> unmounting image
    
    # use the metadata
    host$ ls -l stemcells/metadata/3202/aws/xen/ubuntu-trusty
    filelist
    manifest
    md5
    packages
    sha1
    
    # compare two versions
    host$ ./bin/summarize-diff aws xen ubuntu trusty 3167 3202
    Comparing 3167 to 3202

    ====> filelist
    21c21
    < 097bc6708eaff5dc05127d97e82e720b -rwxr-xr-x 137272 0 0 /bin/cpio
    ---
    > 88e7b233998467a683e4c3e3c8061419 -rwxr-xr-x 137304 0 0 /bin/cpio
    ...snip...


## Metadata

All `bin/metadata-*` scripts are run against the stemcell. Current ones are...

 * `filelist` - lists all files in the filesystem including checksum, permissions, ownership, names, and targets
 * `manifest` - extracts the `stemcell.MF`
 * `md5` - generates the md5 of the tarball
 * `packages` - extracts the `stemcell_dpkg_l.txt` or `stemcell_rpm_qa.txt` package list file
 * `sha1` - generates the sha1 of the tarball

Metadata is cached in `stemcells/metadata/{version}/{iaas}/{hypervisor}/{os_name}-{os_version}`. If the file exists, the metadata script is not rerun.

Scripts probably want to use one of these environment variables...

 * `STEMCELL_MOUNT` - path to the mounted filesystem (e.g. `/mnt/stemcell`)
 * `STEMCELL_TARBALL` - path to the original stemcell tarball (e.g. `/tmp/bosh-stemcell-3202-aws-xen-ubuntu-trusty-go_agent.tgz`)


## Stemcell Tarballs

Stemcells are cached in `stemcells/source` with the convention of `bosh-stemcell-{version}-{iaas}-{hypervisor}-{os_name}-{os_version}-go_agent.tgz`. If the requested version is not found, a download from bosh.io is attempted.
