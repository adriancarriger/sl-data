#!/bin/bash

set -ex

# Run from parent directory
cd "$( dirname "$0" )" && cd ..

graphcool login --token $GRAPHCOOL_TOKEN

if [[ $CIRCLE_BRANCH == "develop" ]]; then
    GRAPHCOOL_TARGET=shared-eu-west-1/cjip7piqe7fuq0144fqk11isw graphcool deploy
fi

if [[ $CIRCLE_BRANCH == "master" ]]; then
    GRAPHCOOL_TARGET=shared-eu-west-1/cjip7ok6w80ka01972tlds06n graphcool deploy
fi
