#!/bin/bash

version=`cat package.json | grep version | cut -d: -f2 | sed -e "s/\"//g" | sed -e "s/ //g" | sed -e "s/\,//g"`

filename=apex.zip

npm install

rm $filename 2>&1 >> /dev/null

zip -x \*node_modules/protobufjs/tests/\* -r $filename _apex_index.js index.js router.js transformer.js constants.js lambda.json package.json node_modules/ README.md LICENSE NOTICE.txt && mv -f $filename dist/$filename


