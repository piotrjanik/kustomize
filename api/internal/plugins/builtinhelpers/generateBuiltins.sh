#!/bin/bash
#
# Generate the Go code for the generator and
# transformer factory functions in
#
#   sigs.k8s.io/kustomize/api/builtins
#
# from the raw plugin directories found under
#
#   sigs.k8s.io/kustomize/plugin/builtin

set -e

myGoPath=$1
if [ -z ${1+x} ]; then
  myGoPath=$GOPATH
fi

if [ -z "$myGoPath" ]; then
  echo "Must specify a GOPATH"
  exit 1
fi

dir=$myGoPath/src/sigs.k8s.io/kustomize

if [ ! -d "$dir" ]; then
  echo "$dir is not a directory."
  exit 1
fi

for goMod in $(find ./plugin/builtin -name 'go.mod'); do
  pdir=$(dirname "${goMod}")
  (cd $pdir; GOPATH=$myGoPath go generate ./...)
done

echo "Formatting $dir/api/builtins"
(cd $dir/api; GOPATH=$myGoPath go fmt ./builtins/...)

echo All done.
