#!/bin/bash

./balena-yocto-scripts/build/barys -m raspberrypi4-64 -d
echo $?
if [$? = 0]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"<@U5QCXSY66> build success!!"}' https://hooks.slack.com/services/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
else
	curl -X POST -H 'Content-type: application/json' --data '{"text":"<@U5QCXSY66> build failed"}' https://hooks.slack.com/services/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
fi



