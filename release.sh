#!/usr/bin/env bash

# get new version from bom
export NS=http://maven.apache.org/POM/4.0.0
export MAVEN_OPTS=[INFO] gpg: signing failed: Inappropriate ioctl for device
-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn

# determin current version
SNAPSHOT_VERSION=`xmllint  --noout  --shell  pom.xml << EOF |  grep -E -v '^(\/|text).*'
 setns x=$NS
 cd //x:project/x:version/text()
 cat .
EOF
`
# now, for the new development version we increase minor by one
DEVELOPMENT_VERSION=`echo $SNAPSHOT_VERSION | awk -F[.-] '{print $1"."$2+1"-"$3}'`
TARGET_VERSION=`echo $SNAPSHOT_VERSION | awk -F[.-] '{print $1"."$2".0"}'`
BRANCH_DEVELOPMENT_VERSION=`echo $SNAPSHOT_VERSION | awk -F[.-] '{print $1"."$2".1-SNAPSHOT"}'`

echo "$SNAPSHOT_VERSION -> $DEVELOPMENT_VERSION, $TARGET_VERSION, $BRANCH_DEVELOPMENT_VERSION"

# we use maven to make the branch
mvn release:branch -DbranchName=$SNAPSHOT_VERSION -DdevelopmentVersion=$DEVELOPMENT_VERSION
git checkout REL-$SNAPSHOT_VERSION
# show what happened:
git branch -l
# this command will make and deploy the actual release.
# echo it for review, it then can be copy/pasted to execute
echo mvn -Pdeploy release:prepare release:perform -DreleaseVersion=$TARGET_VERSION -DdevelopmentVersion=$BRANCH_DEVELOPMENT_VERSION


