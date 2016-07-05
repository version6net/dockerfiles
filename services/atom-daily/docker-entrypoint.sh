#!/bin/bash
set -eo pipefail

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# if command starts with an option, prepend atomd
if [ "${1:0:1}" = '-' ]; then
	set -- atomd "$@"
fi

if [ "$1" = 'atomd' ]; then
	if [ ! -z "$CANNET" ]; then
		sed -iE "s/^CanNet = .*/CanNet = $CANNET/" /etc/atom/atom.conf
	fi
	if [ ! -z "$DEBUG" ]; then
		sed -iE "s/^#\(LogLevelMask\)/\1/" /etc/atom/atom.conf
		sed -iE "s/^LogLevelMask.*/&|LOG_LEVEL_DEBUG/" /etc/atom/atom.conf
	else
		sed -iE "s/^\(LogLevelMask.*\)|LOG_LEVEL_DEBUG/#\1" /etc/atom/atom.conf
	fi
fi

exec "$@"
