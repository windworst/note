#!/bin/bash

set -e

SCRIPT_HOME=$(cd "$(dirname "$0" 2>/dev/null)/..";pwd)
cd $SCRIPT_HOME

type tree > /dev/null 2>&1 || (echo 'please install `tree`'; exit 1)

handle() {
  IFS=''
  while read line
  do
    PREFIX="${line%%.*}"
    PREFIX="${PREFIX//[├│]/|}"
    PREFIX="${PREFIX//[└]/+}"
    PREFIX="${PREFIX//\ /\&nbsp;}"
    PREFIX="${PREFIX//─/-}"
    URL=".${line#*.}"
    URL="${URL// /%20}"
    NAME="${line##*/}"
    [ "$NAME" = '.' ] && NAME='/'
    LINK="[$NAME]($URL)"
    echo "$PREFIX$LINK  "
  done
}

export LC_ALL=C.UTF-8 LANG=C.UTF-8
elif test $TREE_VERSION == 'v2.1.1'; then
  export LC_ALL=zh_CN.UTF-8 LANG=zh_CN.UTF-8
fi

CONTENT_FILE=README.md
echo '# Contents' > "$CONTENT_FILE"

(tree --sort name -v -f --noreport | handle) >> "$CONTENT_FILE"