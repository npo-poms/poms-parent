NS=http://maven.apache.org/POM/4.0.0

pom_version () {
  xmllint  --noout  --shell  $1/pom.xml << EOF |  grep -E -v '^(\/|text).*'
 setns x=$NS
 cd //x:project/x:version/text()
 cat .
EOF
}

property_value () {
  xmllint  --noout  --shell  $1/pom.xml << EOF |  grep -E -v '^(\/|text).*'
 setns x=$NS
 cd //x:project/x:properties/x:$2/text()
 cat .
EOF
}

set_property_value() {
xmllint --shell $1/pom.xml << EOF > /dev/null
setns x=$NS
cd /x:project/x:properties/x:$2
set $3
save
EOF
}

# Takes a version in the form a.b[.-]c and increases b by one
inc_version() {
  echo $1 | gawk 'match($1, /([0-9]+)\.([0-9]+)([\.-])(.*)/, a) {print a[1]"."(a[2]+1)a[3]a[4]}'
}

# Takes a version in the form a.b.c-SNAPSHOT and returns a.b.c+1-SNAPSHOT
release_version() {
  echo $1 | gawk 'match($1, /([0-9]+)\.([0-9]+)([\.-])(.*)/, a) {print a[1]"."(a[2]+1)a[3]a[4]}'
}

is_snapshot() {
  if [[ "$1" =~ ^.*-SNAPSHOT$ ]]; then
     echo "1"
  else
     echo ""
  fi
}

clone_or_update() {
  if [ ! -d $2 ] ; then
    git clone $1/$2.git
   else
    (cd $2 || exit ;git pull $1/$2)
fi

}

branch() {
  pwd
  cd $1 || exit 1
  version=$(pom_version .)
  dev_version=$(inc_version version)
  mvn release:branch -DbranchName=$version -DdevelopmentVersion=$dev_version
  git checkout REL-$version
  # show what happened:
  git branch -l
}
release() {
  cd $1 || exit 1

 # this command will make and deploy the actual release.
# echo it for review, it then can be copy/pasted to execute
echo mvn -Pdeploy release:prepare release:perform -DreleaseVersion=$TARGET_VERSION -DdevelopmentVersion=$BRANCH_DEVELOPMENT_VERSION
}

branch_and_release() {
  branch $1
  release $1
}

release_version() {
  echo $1 | awk -F[.-] '{print $1"."$2".0}'
}
