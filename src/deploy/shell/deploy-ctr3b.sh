#!/usr/bin/env bash
SCDIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

cat > $SCDIR/deploy-ctr3b.shell <<EOF
task create --name timestamp-ctr3b --definition "timestamp-app-1: timestamp && timestamp-batch-1: timestamp-batch && timestamp-app-2: timestamp3 && timestamp-batch-2: timestamp-batch3"
task launch --name timestamp-ctr3b --properties app.composed-task-runner.logging.level.root=debug
EOF

"$SCDIR/shell.sh" --spring.shell.commandFile=$SCDIR/deploy-ctr3b.shell
