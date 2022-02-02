## Tanzu CLI inside a docker container.

This allows your to run multiple versions of the Tanzu CLI on the same system.

Requirements:

* Docker installed locally (Mac/Linux). (On MacOS use a version before 4.3)
* The `tanzu-cli` and `kubectl` packages need to be downloaded manually and placed in the appropriate directories.

How to use:

Clone this repo:

```
git clone https://github.com/pvdbleek/tanzu-cli-docker.git
```

Make sure you download the needed `tanzu-cli` and `kubectl` packages in the `tanzu-cli-binary-archives` dir.

Links:

* [0.10.0](tanzu-cli-binary-archives/0.10.0)
* [1.3.1](tanzu-cli-binary-archives/1.3.1)
* [1.4.0](tanzu-cli-binary-archives/1.4.0)
* [1.4.1](tanzu-cli-binary-archives/1.4.1)
* Not needed for `tce-0.9.1`

To build an image (only needed once):

```
cd tanzu-cli-docker
./tanzu-cli.sh build 1.4.0
```

To run an image (drops you into a shell in the container):

```
./tanzu-cli.sh start 1.4.0
```




