#!/usr/bin/env bash
if [ ! -d /tmp ]; then
  echo couldn\'t find the /tmp directory, are you running on Linux ?
else
  TARGET_DIR="/tmp/buildroot.volumio"
  REPONAME="buildroot.rk3399.external"
  BUILDROOT_REPO="https://github.com/flatmax/$REPONAME.git"
  BUILDROOT_REPO_BRANCH="volumio"
  BR_REPONAME="buildroot.volumio"
  PLAT_ARCHIVE="m4.tar.xz"
  mkdir -p $TARGET_DIR
  if [ ! -d $TARGET_DIR/$REPONAME ]; then
    git clone --depth 1  --branch $BUILDROOT_REPO_BRANCH $BUILDROOT_REPO $TARGET_DIR/$REPONAME
  fi
  if [ ! -d $TARGET_DIR/$BR_REPONAME ]; then
    git clone git://git.busybox.net/buildroot $TARGET_DIR/$BR_REPONAME
    pushd $TARGET_DIR/$BR_REPONAME
    git checkout bcde80febd2f0455ba5c34f8aa870fc8133749ae
    popd
  fi
  if [ -f $PLAT_ARCHIVE ]; then
    mv $PLAT_ARCHIVE $PLAT_ARCHIVE.`date +%s`
  fi
  ln -fs $TARGET_DIR/$BR_REPONAME/output/images/$PLAT_ARCHIVE
  . $TARGET_DIR/$REPONAME/setup.sh $TARGET_DIR/$BR_REPONAME
  make
fi
