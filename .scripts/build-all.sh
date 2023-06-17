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

for package in $(ls /content/pkgsrc/gomicro); do

  # ignore build-essential
  if [ "${package}" = "build-essential" ]; then
    continue
  fi

  # ignore gomicro-dns
  if [ "${package}" = "gomicro-dns" ]; then
    continue
  fi

  # ignore hookyd
  if [ "${package}" = "hookyd" ]; then
    continue
  fi

  # ignore microagent-git
  if [ "${package}" = "microagent-git" ]; then
    continue
  fi

  # ignore microagent-http
  if [ "${package}" = "microagent-http" ]; then
    continue
  fi

  # ignore microagent-logtap
  if [ "${package}" = "microagent-logtap" ]; then
    continue
  fi

  # ignore microagent-postoffice
  if [ "${package}" = "microagent-postoffice" ]; then
    continue
  fi

  # ignore microagent-pulse
  if [ "${package}" = "microagent-pulse" ]; then
    continue
  fi

  # ignore microagent-warehouse
  if [ "${package}" = "microagent-warehouse" ]; then
    continue
  fi

  # ignore openssh-auth-script
  if [ "${package}" = "openssh-auth-script" ]; then
    continue
  fi

  # ignore if it's not a real package
  if [ ! -f /content/pkgsrc/gomicro/${package}/Makefile ]; then
    continue
  fi

  # skip if package is already built
  pkg_name=$(/opt/gomicro/bin/bmake -C /content/pkgsrc/gomicro/${package} show-var VARNAME=PKGNAME)
  if [ -f /content/packages/pkgsrc/gomicro/Linux/All/${pkg_name}.tgz ]; then
    echo "skipping ${package} as it's already built"

    # cleaning cruft
    if [ -d /chroot/${package} ]; then
      sandbox rm ${package}
    fi

    continue
  fi
  echo ${package}
  continue

  # 1) create a chroot
  if [ ! -d /chroot/${package} ]; then
    sandbox create ${package}
  fi

  # 2) make package
  run_in_chroot ${package} "/opt/gomicro/bin/bmake -C /content/pkgsrc/gomicro/${package} package"

  # 3) upload package
  run_in_chroot ${package} "/opt/gomicro/bin/bmake -C /content/pkgsrc/gomicro/${package} publish"

  # 4) cleanup chroot
  # /opt/util/sandbox rm ${package}
done

# Other packages to create
for package in devel/jq; do

  # ignore build-essential
  if [ "${package}" = "build-essential" ]; then
    continue
  fi

  # ignore if it's not a real package
  if [ ! -f /content/pkgsrc/${package}/Makefile ]; then
    continue
  fi

  # skip if package is already built
  pkg_name=$(/opt/gomicro/bin/bmake -C /content/pkgsrc/${package} show-var VARNAME=PKGNAME)
  if [ -f /content/packages/pkgsrc/gomicro/Linux/All/${pkg_name}.tgz ]; then
    echo "skipping ${package} as it's already built"

    # cleaning cruft
    if [ -d /chroot/${package} ]; then
      sandbox rm ${package}
    fi

    continue
  fi
  echo ${package}
  continue

  chroot=${package/\//-}

  # 1) create a chroot
  if [ ! -d /chroot/${chroot} ]; then
    sandbox create ${chroot}
  fi

  # 2) make package
  run_in_chroot ${chroot} "/opt/gomicro/bin/bmake -C /content/pkgsrc/${package} package"

  # 3) upload package
  run_in_chroot ${chroot} "/opt/gomicro/bin/bmake -C /content/pkgsrc/${package} publish"

  # 4) cleanup chroot
  # /opt/util/sandbox rm ${package}
done
