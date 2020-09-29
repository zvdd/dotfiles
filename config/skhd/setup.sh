#!/bin/bash

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)
ln -sf $BASE/skhdrc ~/.skhdrc
