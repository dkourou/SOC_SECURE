#!/bin/bash
IDLE=$(xprintidle)
LIMIT=900000

if [ $IDLE -gt $LIMIT ]; then
 fusermount -u ~/SOC_SECURE/mount
fi
