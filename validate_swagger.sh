#!/bin/bash
for i in `find . -name "swagger.yaml" -type f`; do
    echo "validating $i"
    pipenv run openapi-spec-validator $i
done