#!/bin/bash

scriptDir="`dirname "$0"`"
cd $scriptDir
set -a; source ../../.env; set +a

env | grep '^MAFSHOU'