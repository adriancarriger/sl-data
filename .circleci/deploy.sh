#!/bin/sh

set -e

# Run from parent directory
cd "$( dirname "$0" )" && cd ..

prisma login -k $PRISMA_CLI_KEY &>/dev/null

if [[ $CIRCLE_BRANCH == "develop" ]]; then
  PRISMA_ENDPOINT=https://us1.prisma.sh/adrian-carriger-35d3e6/sl-data/staging \
  PRISMA_SECRET=PRISMA_SECRET_STAGING \
  prisma deploy
fi

if [[ $CIRCLE_BRANCH == "master" ]]; then
  PRISMA_ENDPOINT=https://us1.prisma.sh/adrian-carriger-35d3e6/sl-data/production \
  PRISMA_SECRET=PRISMA_SECRET_PRODUCTION \
  prisma deploy
fi
