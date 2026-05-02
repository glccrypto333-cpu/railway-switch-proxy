#!/bin/bash
set -e

: "${PROXY_USER:=switch}"
: "${PROXY_PASS:?PROXY_PASS is required}"

htpasswd -bc /etc/squid/passwd "$PROXY_USER" "$PROXY_PASS"

mkdir -p /var/spool/squid /var/log/squid
squid -Nz || true
squid -N -d 1
