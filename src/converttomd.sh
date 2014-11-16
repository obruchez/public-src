#!/bin/bash

SRC_DIR=.
DST_DIR=..

declare -a list_types=(books concerts crashes exhibitions hikes movies plays trips)

for list_type in ${list_types[@]}
do
  echo "Generating $list_type MD file..."
  base_md_filename="$(tr '[:lower:]' '[:upper:]' <<< ${list_type:0:1})${list_type:1}"
  saxon -s:$SRC_DIR/$list_type.xml -xsl:$SRC_DIR/xmltomd.xsl > $DST_DIR/$base_md_filename.md
done
