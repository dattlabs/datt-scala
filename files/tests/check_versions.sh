#!/bin/bash

status=0
scalac_version=`scalac -version 2>&1 | grep "^Scala compiler version" | grep -oP '\K(\d+\.\d+\.\d+)'`
[[ "$scalac_version" = "2.10.3" ]] || { echo "Incorrect scalac version: $scalac_version."; status=1; }

scala_version=`scala -version 2>&1 | grep "^Scala code runner" | grep -oP '\K(\d+\.\d+\.\d+)'`
[[ "$scala_version" = "2.10.3" ]] || { echo "Incorrect scala version: $scala_version."; status=1; }

sbt_version=`sbt --version 2>&1 | grep version | grep -oP '\d+\.\d+\.\d+'`
[[ "$sbt_version" = "0.13.1" ]] || { echo "Incorrect sbt version: $sbt_version."; status=1; }

exit $status
