#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/$UUID/data

if zfs list ${DDS} 1>/dev/null 2>&1; then
        zfs create ${DDS}/unifi-data || true
        zfs create ${DDS}/unifi-logs || true
        zfs create ${DDS}/unifi-work || true

        zfs set mountpoint=/opt/local/UniFi/data ${DDS}/unifi-data
        zfs set mountpoint=/opt/local/UniFi/logs ${DDS}/unifi-logs
        zfs set mountpoint=/opt/local/UniFi/work ${DDS}/unifi-work

        zfs set compression=lz4 ${DDS}
fi

chown unifi:other /opt/local/UniFi/data || true
chown unifi:other /opt/local/UniFi/logs || true
chown unifi:other /opt/local/UniFi/work || true
