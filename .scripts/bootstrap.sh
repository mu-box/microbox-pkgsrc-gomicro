#!/bin/bash

detect_platform() {
  if [ $(uname | grep 'SunOS') ]; then
    echo "SmartOS"
  elif [ $(uname | grep 'Linux') ]; then
    echo "Linux"
  fi
}

project='gomicro'
platform=$(detect_platform)
depends=(
  net/libfetch
  )
packages=(
  devel/bmake
  pkgtools/bootstrap-mk-files
  archivers/bzip2
  sysutils/coreutils
  devel/gettext-lib
  archivers/libarchive
  security/mozilla-rootcerts
  lang/nawk
  textproc/nbsed
  devel/ncurses
  security/openssl
  pkgtools/pkg_alternatives
  pkgtools/pkg_install
  pkgtools/pkg_install-info
  pkgtools/pkgin
  devel/readline
  databases/sqlite3
  archivers/xz
  devel/zlib
  )
extra_packages=(
  pkgtools/mksandbox
  )

# 0) clean start
sudo rm -rf /opt/${project}
sudo rm -rf /var/tmp/${project}-bootstrap
# sudo rm -rf /content/packages/pkgsrc/gomicro/Linux

# 1) install build-essential
sudo apt-get -y update -qq && \
sudo apt-get install -y build-essential

# 2) run bootstrap process
sudo GCCBASE=/usr \
  SH=/bin/bash \
  /content/pkgsrc/bootstrap/bootstrap \
  --compiler=gcc \
  --abi 64 \
  --full \
  --prefer-pkgsrc=yes \
  --pkgdbdir=/opt/${project}/pkg \
  --prefix=/opt/${project} \
  --varbase=/var/${project} \
  --workdir=/var/tmp/${project}-bootstrap

# 3) generate mk.conf
sudo bash -c "/bin/cat > /opt/${project}/etc/mk.conf" <<END
.ifdef BSD_PKG_MK # begin pkgsrc settings

ABI=      64
PKGSRC_COMPILER=  gcc
GCCBASE=    /usr

PKG_DBDIR=    /opt/${project}/pkg
LOCALBASE=    /opt/${project}
VARBASE=    /var/${project}
PKG_TOOLS_BIN=    /opt/${project}/sbin
PKGINFODIR=   info
PKGMANDIR=    man
DEPENDS_TARGET=   bin-install

PREFER_PKGSRC=    yes

TOOLS_PLATFORM.install?=  /opt/${project}/bin/install-sh
TOOLS_PLATFORM.sh?=   /opt/${project}/bin/pdksh
TOOLS_PLATFORM.ksh?=    /opt/${project}/bin/pdksh
TOOLS_PLATFORM.awk?=    /opt/${project}/bin/nawk
TOOLS_PLATFORM.sed?=    /opt/${project}/bin/nbsed
TOOLS_PLATFORM.sh?=   /bin/bash

DISTDIR=      /content/distfiles
PACKAGES=     /content/packages/pkgsrc/${project}/Linux

WRKOBJDIR=      /var/tmp/pkgsrc-build-${project}

MAKE_JOBS=      6

SU_CMD=       sudo sh -c

LDFLAGS+=     -L/lib/x86_64-linux-gnu
LDFLAGS+=     -L/usr/lib/x86_64-linux-gnu
CFLAGS+=      -I/usr/include/x86_64-linux-gnu

ALLOW_VULNERABLE_PACKAGES=    yes
SKIP_LICENSE_CHECK=        yes
FETCH_USING=            curl

.endif      # end pkgsrc settings
END

# 4) make a tempoary tarball of the minimal bootstrap
sudo tar -czf /var/tmp/bootstrap.minimal.tar.gz -C / opt/${project}

# 5) build and install dependencies
for i in ${depends[@]}; do
  /opt/${project}/bin/bmake -C /content/pkgsrc/${i} package
  /opt/${project}/bin/bmake -C /content/pkgsrc/${i} install
done

# 6) create extra necessary packages
for i in ${packages[@]}; do
  /opt/${project}/bin/bmake -C /content/pkgsrc/${i} package
done

# 7) blast /opt/${project}
sudo rm -rf /opt/${project}

# 8) extract minimal bootstrap
sudo tar -xzf /var/tmp/bootstrap.minimal.tar.gz -C /

# 9) install the packages we just built
for i in ${packages[@]}; do
  pkg_name=$(/opt/${project}/bin/bmake -C /content/pkgsrc/${i} show-var VARNAME=PKGNAME)
  sudo /opt/${project}/sbin/pkg_add /content/packages/pkgsrc/${project}/${platform}/All/${pkg_name}.tgz
done

# 10) set the source in pkgin
sudo bash -c "/bin/cat > /opt/${project}/etc/pkgin/repositories.conf" <<END
# $Id: repositories.conf,v 1.3 2012/06/13 13:50:17 imilh Exp $
#
# Pkgin repositories list
#
# Simply add repositories URIs one below the other
#
# WARNING: order matters, duplicates will not be added, if two
# repositories hold the same package, it will be fetched from
# the first one listed in this file.
#
# This file format supports the following macros:
# $arch to define the machine hardware platform
# $osrelease to define the release version for the operating system
#
# Remote ftp repository
#
# ftp://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/$arch/5.1/All
#
# Remote http repository
#
# http://mirror-master.dragonflybsd.org/packages/$arch/DragonFly-$osrelease/stable/All
#
# Local repository (must contain a pkg_summary.gz or bz2)
#
# file:///usr/pkgsrc/packages/All

# Microbox public repository
https://pkgsrc.microbox.cloud/microbox/${project}/${platform}
END

# 10) tar
sudo tar -czf /var/tmp/bootstrap.tar.gz -C / opt/${project}

# 11) upload
curl \
  -k \
  -X POST \
  -H "Key: ${MICROBOX_SECRET}" \
  --data-binary \@/var/tmp/bootstrap.tar.gz \
  https://pkgsrc.microbox.cloud/${MICROBOX_USER}/${project}/${platform}/bootstrap.tar.gz

# 12) build/install/publish extra packages
for i in ${extra_packages[@]}; do
  /opt/${project}/bin/bmake -C /content/pkgsrc/${i} package
  /opt/${project}/bin/bmake -C /content/pkgsrc/${i} install
  /opt/${project}/bin/bmake -C /content/pkgsrc/${i} publish
done

# 13) mv bootstrap into cache for chroots
cp -f /var/tmp/bootstrap.tar.gz \
  /content/packages/pkgsrc/${project}/${platform}/bootstrap.tar.gz
