# Verify Hash

## Setup and first run
Very simple shell script to check if a downloaded file has been tampered.

Download the file `verify-hash.sh` (or the whole repo) and run it:
```
curl https://raw.githubusercontent.com/brootware/verify-hash.sh/master/verify-hash.sh > verify-hash.sh && chmod +x verify-hash.sh
./verify-hash.sh <hash_algo> <file> <source_hash>
```

For example, with a downloaded file:
```
./verify-hash.sh sha512 Downloads/path/to/generic/file.tgz 7A186A2A007B2DFD880571F7214A7D329C972510A460A8BDBEF9F7F2A891019343C020F74B496A61E5AA42BC9E9A79CC99DEFE5CB3BF8B6F49C07E01B259BC6B
```

You might need to give the file the correct permissions, using `chmod` and `chown`.

Once running, it will show you the following output:
```
Computed hash: 7a186a2a007b2dfd880571f7214a7d329c972510a460a8bdbef9f7f2a891019343c020f74b496a61e5aa42bc9e9a79cc99defe5cb3bf8b6f49c07e01b259bc6b
Given hash:    7a186a2a007b2dfd880571f7214a7d329c972510a460a8bdbef9f7f2a891019343c020f74b496a61e5aa42bc9e9a79cc99defe5cb3bf8b6f49c07e01b259bc6b
OK: Keys match correctly.
```

## If you want to add this script to path, you can run the below commands

```
curl https://raw.githubusercontent.com/brootware/verify-hash.sh/master/verify-hash.sh > verifyhash && chmod +x verifyhash
sudo mv verifyhash /opt/
export PATH=$PATH:/opt
verifyhash
```

## Features
This supports all the algorithms of the form `*sum` in Linux. For example `sha512sum`, `md5sum`, so on and so forth.

Please note that the string matching is case insensitive on purpose.
