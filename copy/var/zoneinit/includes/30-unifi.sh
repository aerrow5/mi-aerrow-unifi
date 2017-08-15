#!/bin/bash

#install and launch:
svccfg import /opt/local/lib/svc/manifest/unifi.xml
svcadm enable svc:/network/unifi:default
