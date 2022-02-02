#!/bin/bash

exit_error () {
    echo $1
    exit 1
}

exit_usage () {
    echo $1
    echo ""
    echo "Usage: tanzu-cli.sh [command] [version]"
    echo "  Where:"
    echo "    [command] is either \"build\" or \"start\""
    echo "    [version] is either \"0.10.0\", \"1.3.1\", \"1.4.0\", \"1.4.1\" or \"tce-0.9.1\""
    exit 1
}

build_image () {
    case $1 in
      "0.10.0"|"1.3.1"|"1.4.0"|"1.4.1"|"tce-0.9.1")
        VERSION=$1
        docker build -f dockerfiles/${VERSION}/Dockerfile -t tanzu-cli:${VERSION} .
        ;;
      *)
        exit_usage "Error: The given version is not supported."
        ;;
    esac
}

start_image () {
    case $1 in
      "0.10.0"|"1.3.1"|"1.4.0"|"1.4.1"|"tce-0.9.1")
        VERSION=$1
        docker run --rm -ti --network host -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}/config/${VERSION}/.kube:/root/.kube -v ${PWD}/config/${VERSION}/.kube-tkg:/root/.kube-tkg -v ${PWD}/config/${VERSION}/.config:/root/.config -v ${PWD}/config/${VERSION}/:/root/config/ tanzu-cli:${VERSION} /bin/bash
        ;;
      *)
        exit_usage "Error: The given version is not supported."
        ;;
    esac
}

[ -d "${PWD}/config" ] || exit_error "Error: Can't find config directory, please execute the script from the base directory."
[ -d "${PWD}/dockerfiles" ] || exit_error "Error: Can't find dockerfiles directory, please execute the script from the base directory."
[ -d "${PWD}/tanzu-cli-binary-archives" ] || exit_error "Error: Can't find tanzu-cli-binary-archives directory, please execute the script from the base directory."

[ -z "$1" ] && exit_usage "Error: COMMAND is not set"
[ -z "$2" ] && exit_usage "Error: VERSION is not set"

case $1 in
  "build")
     build_image $2
     ;;
  "start")
     start_image $2
     ;;
  * )
     exit_usage "Error: $1 is not a valid command."
     ;;
esac

exit 0