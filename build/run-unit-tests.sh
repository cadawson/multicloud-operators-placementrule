#!/bin/bash
echo "UNIT TESTS GO HERE!"

echo "Install Kubebuilder components for test framework usage!"

_OS=$(go env GOOS)
_ARCH=$(go env GOARCH)
KubeBuilderVersion="2.3.1"

# download kubebuilder and extract it to tmp
curl -L https://go.kubebuilder.io/dl/"$KubeBuilderVersion"/"${_OS}"/"${_ARCH}" | tar -xz -C /tmp/

# move to a long-term location and put it on your path
# (you'll need to set the KUBEBUILDER_ASSETS env var if you put it somewhere else)
sudo mv /tmp/kubebuilder_"$KubeBuilderVersion"_"${_OS}"_"${_ARCH}" /usr/local/kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# Run unit test
export IMAGE_NAME_AND_VERSION=${1}
make test
