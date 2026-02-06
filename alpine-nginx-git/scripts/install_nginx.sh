#!/bin/sh

apk update

apk add nginx

rc-update add nginx default

rc-service nginx start

rc-service nginx status

