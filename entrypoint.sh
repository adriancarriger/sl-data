#!/bin/sh
set -e

echo "Setting up local graphcool instance"

graphcool local up
graphcool deploy -t local -n localtest -c local -j

exec "$@"
