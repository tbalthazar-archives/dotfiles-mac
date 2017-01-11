#!/bin/bash

PKGS=('foo' 'bar' 'widget')

for pkg in ${PKGS[@]}; do
  echo $pkg
done
