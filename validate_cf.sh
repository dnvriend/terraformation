#!/bin/bash
for i in `find . -name "*.yaml" -type f`; do
    echo "validating $i"
    pipenv run cfn-lint $i
done