module sigs.k8s.io/kustomize/plugin/builtin/configmapgenerator

go 1.13

require (
	sigs.k8s.io/kustomize/api v0.1.1
	sigs.k8s.io/yaml v1.1.0
)

replace sigs.k8s.io/kustomize/api => ../../../api
