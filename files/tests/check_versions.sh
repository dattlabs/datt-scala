#!/bin/bash

scala_version=`scalac -version 2>&1 | grep "^Scala compiler version" | grep -oP '\K(\d+\.\d+\.\d+)'`
[[ "$scala_version" = "2.10.3" ]] && exit 0 || { echo "Incorrect version: $scala_version."; exit 1; }
