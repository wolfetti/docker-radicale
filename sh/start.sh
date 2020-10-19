#!/bin/bash

if [ ! -f /conf/radicale.conf ]; then
    cp /default.conf /conf/radicale.conf
fi

radicale -C /conf/radicale.conf
