#!/usr/bin/env bash

source ./functions.sh

#dry_run=1

if ! [ $dry_run ]; then
 clone_or_update git@github.com:npo-poms poms-shared
 clone_or_update git@git.vpro.nl:npo user
fi

poms_parent_vpro_shared_version=$(property_value ../poms-parent vpro.shared.version)
if [ $(is_snapshot $poms_parent_vpro_shared_version) ] ; then
  #clone_or_update git@github.com:vpro vpro-shared
  actual_vpro_shared_version=$(pom_version vpro-shared)
  echo Found version ${actual_vpro_shared_version}
  if [ "$poms_parent_vpro_shared_version" != "$actual_vpro_shared_version" ] ; then
    echo "$poms_parent_vpro_shared_version" != "$actual_vpro_shared_version"
    exit 1
  fi
  vpro_shared_release_version=$(release_version $actual_vpro_shared_version)
  set_property_value ../poms-parent vpro.shared.version $vpro_shared_release_version
  if ! [ $dry_run ] ; then branch_and_release vpro-shared ; fi
else
  echo no vpro shared release needed $poms_parent_vpro_shared_version
fi


