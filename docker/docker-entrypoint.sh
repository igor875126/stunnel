#!/usr/bin/env sh
set -e

if [ $# -gt 0 ]
then
    exec "$@"
else
    # Execute ssh
    exec /usr/bin/ssh $SSH_ARGS && while true; do /bin/sleep 1; done
fi