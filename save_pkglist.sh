#!/bin/sh

ARCH=`uname -m`
PKG_DIR="/var/cache/pacman/pkg"
SUFFIX="-${ARCH}.pkg.tar.xz"
SUFFIX_ANY="-any.pkg.tar.xz"
PKGFILE="pkg`date +"%Y%m%d"`.list"
NOTFOUND="not_found`date +"%Y%m%d"`.list"

echo "package file: ${PKGFILE}"
echo "Please wait..."

pkg_num=`pacman -Q | wc -l`
not_found=0
while read line
do
  pkg=`echo ${line} | sed -e 's/ /-/g'`
  list=`ls ${PKG_DIR}/${pkg}* 2>&1`
  if echo ${list} 2>&1 | grep "any" > /dev/null; then
    full=${PKG_DIR}/${pkg}${SUFFIX_ANY}
  else
    full=${PKG_DIR}/${pkg}${SUFFIX}
  fi
  if ls ${full} 2>&1 | grep "No such" > /dev/null; then
    ((not_found++))
    echo "Not found: " ${full}
    echo ${full} >> ${NOTFOUND}
    continue
  fi
  echo ${full} >> ${PKGFILE}
done <<EOF
`pacman -Q`
EOF

echo "Done!"
found=$((${pkg_num} - ${not_found}))
echo "${found}/${pkg_num} packages are saved correctly!"
