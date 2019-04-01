#!/usr/bin/env bash
set -e

CI_BRANCH=${TRAVIS_BRANCH}

echo "$CI_BRANCH"

export SONAR_USERNAME=useragenttool-ci
export SONAR_QUALITY_GATE=90Coverage-noIssues
export SONAR_HOST='http://sonar-backend.grindr.com'
export SONAR_JDBC_URL='jdbc:mysql://sonar-backend.grindr.com:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&connectTimeout=0&socketTimeout=0&autoReconnect=true'

case $CI_BRANCH in
    spike*)
    ;; # Spike branches don't need code/coverage analysis
    *)
        ./mavenBuildWithSemanticVersion sonar:sonar -Dsonar.branch=$CI_BRANCH -Dsonar.login=$SONAR_USERNAME -Dsonar.password=$SONAR_PASSWORD -Dsonar.host.url=$SONAR_HOST -Dsonar.jdbc.url=$SONAR_JDBC_URL -Dsonar.qualitygate=$SONAR_QUALITY_GATE
    ;;
esac
