#!/bin/bash

#
# Look for and monitor the progress of a kubernetes deployment.
#

NAMESPACE=${NAMESPACE:-$1}
APP=${APP:-$2}

set -eou pipefail

if [ -z "${NAMESPACE}" ] || [ -z "${APP}" ]; then
    echo "Please set a NAMESPACE and APP (or first and second arguments to this command respectively)"
    exit 1
fi

echo "Checking [${APP}] deployment within [${NAMESPACE}]..."

I=1
STATE=0

function check_me() {
    set +e
    STATUS=$(kubectl rollout status deploy/${2} --namespace=${1} --watch=false 2>&1)
    set -e
    CODE=$?
    if [ ${CODE} -eq 0 ] && [ "${STATUS}" = *"successful"* ]; then
        return 1
    fi
    return 0
}

for I in {1..10}
do
    echo "Checking rollout status [${I}]"
    check_me ${NAMESPACE} ${APP}
    if [ "$?" = "1" ]; then
        echo "Completed deployment successfully!"
        exit 0
    fi
    sleep 1
done

echo "Unable to confirm deployment success."
exit 1

