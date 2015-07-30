#!/bin/bash
keys="--keys total,source,comment"
slocBin="~/node_modules/sloc/bin/sloc"
ignoreNonCode=".*\.html|.*\.xml|.*\.svg"
ignoreBuild="node_modules|dist|bower_components|\.tmp"
echo "Source lines of code (sloc):"

if [ -z "$1" ]; then
  command="$slocBin . -e '$ignoreNonCode|$ignoreBuild' $keys"
  eval "$command"
elif [ "$1" = "-e" ]; then
  command="$slocBin . -e \"$ignoreNonCode|$ignoreBuild|$2\" $keys"
  eval "$command"
#  eval $slocBin . -e "$ignoreNonCode|$ignoreBuild|$2" --keys total,source,comment
elif [ "$1" = "-v" ]; then
   command="$slocBin . -e \"$ignoreNonCode|$ignoreBuild\" --details --format cli-table $keys"
   eval "$command"
#   eval $slocBin . -e "$ignore" --details --format cli-table --keys total,source,comment
else #wc: invalid option -- 'a'
        echo "invalid argument '$1'"
        echo "The following options are accepted:"
        echo " -v               verbose: Print sloc for each file"
        echo " -e <ign>         exclude: Add <ign> to exclude list"
        echo "                  EX: '.*\.coffee' to exclude .coffee files"
        echo "                  EX: 'build' to exclude build directory"
        echo "                  EX: '.*\.coffee|build' to exclude both"
        echo "Only one option may be used at a time."
fi

