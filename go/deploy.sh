#!/bin/bash

set -x

echo "start deploy ${USER}"
GOOS=linux go build -o isuumo
for server in isu01 ; do
  ssh -t $server "sudo systemctl stop isuumo.go.service"
  scp ./isuumo $server:/home/isucon/isuumo/webapp/go/isuumo
  rsync -vau ../mysql/ $server:/home/isucon/isuumo/webapp/mysql/
  ssh -t $server "sudo systemctl start isuumo.go.service"
done

echo "finish deploy ${USER}"
