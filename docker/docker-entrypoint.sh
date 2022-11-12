#!/usr/bin/env sh
set -e

if [ $# -gt 0 ]
then
    exec "$@"
else
    # Execute ssh
    exec /usr/bin/ssh $SSH_ARGS
fi