#! /bin/bash
# this script removes all URI encoding from file names in the current directory

find . -depth -exec rename 'use URI::Escape; $_ = uri_unescape $_' *%* {} +
