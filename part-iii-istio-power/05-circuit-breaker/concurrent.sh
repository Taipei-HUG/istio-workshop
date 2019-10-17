#!/bin/sh

FORTIO_POD=$(kubectl get pod | grep fortio | awk '{ print $1 }')
kubectl exec -it $FORTIO_POD  -c fortio /usr/bin/fortio -- load -c $1 -qps 0 -n 30 -loglevel Warning http://httpbin:8000/get