#!/bin/bash

run_in_chroot() {
  chroot=$1
  cmd=$2
  user=`whoami`
  sudo \
    /chroot/${chroot}/sandbox \
      /bin/su \
        - \
        ${user} \
        -c "${cmd}"
}

for package in $(ls /content/pkgsrc/gonano); do

  # ignore build-essential
  if [ "${package}" = "build-essential" ]; then
    continue
  fi

  # ignore if it's not a real package
  if [ ! -f /content/pkgsrc/gonano/${package}/Makefile ]; then
    continue
  fi

  # 1) create a chroot
  sandbox create ${package}

  # 2) make package
  run_in_chroot ${package} "/opt/gonano/bin/bmake -C /content/pkgsrc/gonano/${package} package"

  # 3) upload package
  # run_in_chroot ${package} "/opt/gonano/bin/bmake -C /content/pkgsrc/gonano/${package} publish"

  # 4) cleanup chroot
  # /opt/util/sandbox rm ${package}
done