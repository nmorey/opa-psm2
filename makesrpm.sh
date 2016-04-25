#!/bin/bash
RPM_NAME=libpsm2

make distclean
rm -rf temp.$$

make dist

mkdir -p temp.$$/{BUILD,RPMS,SOURCES,SPECS,SRPMS,BUILDROOT}
cp ./$RPM_NAME-*.tar.gz temp.$$/SOURCES
make specfile
cp $RPM_NAME.spec temp.$$/SPECS
rpmbuild -bs --define "_topdir $PWD/temp.$$" --nodeps temp.$$/SPECS/$RPM_NAME.spec

echo The source rpm is in temp.$$/SRPMS/`ls temp.$$/SRPMS`
