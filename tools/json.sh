#!/bin/bash

shopt -s xpg_echo
device=${TARGET_PRODUCT#*_}
OUT="$OUT_DIR/target/product/$device"
#$OUT_DIR/target/product/$device"
echo "{\\n  \"response\": [\\n    {\\n      \"datetime\": \"$(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2)\",\\n      \"filename\": \"$(basename $(ls $OUT/KangOS*.zip))\",\\n      \"id\": \"$((md5sum $OUT/KangOS*.zip) | cut -d ' ' -f1)\",\\n      \"romtype\": \"nightly\",\\n      \"size\": $(stat -c%s $OUT/KangOS*.zip | cut -d= -f2),\\n      \"url\": \"Paste Kangos Download Link\",\\n      \"version\": \"$(grep ro\.kangos.\build\.version $OUT/system/product/build.prop | cut -d= -f2)\"\\n    }\\n  ]\\n}" | tee $OUT/update
