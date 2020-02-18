docker build -t poddns .
VERSION=4.2.1
docker tag poddns glennswest/poddns:${VERSION}
docker push glennswest/poddns:${VERSION}
#docker push ctl.ncc9.com:5000/svcdns

