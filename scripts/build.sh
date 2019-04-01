#!/usr/bin/env bash
set -e

# Deploy to Nexus if successful build and tag commit
if [ -n "${TRAVIS_TAG}" ]; then
    mvn $@ -Dbuild.version="$(git describe --tags)" deploy
else
    ./mavenBuildWithSemanticVersion -B clean package
    ./scripts/sonar.sh
fi
