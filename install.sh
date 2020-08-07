#!/usr/bin/env bash

if [[ ! -d ./hamlet ]]; then

    # defaults
    HAMLET_CLONE_ROOT_DEFAULT="/opt/hamlet"
    HAMLET_REPO_CFG_DEFAULT="https://raw.githubusercontent.com/hamlet-io/hamlet-bootstrap/master/config.json"
    HAMLET_REPO_BRANCH_DEFAULT="master"
    HAMLET_REPO_DEPTH_DEFAULT=1

    export HAMLET_REPO_CFG="${HAMLET_REPO_CFG:-$HAMLET_REPO_CFG_DEFAULT}"
    export HAMLET_REPO_BRANCH="${HAMLET_REPO_BRANCH:-$HAMLET_REPO_BRANCH_DEFAULT}"
    export HAMLET_REPO_DEPTH=${HAMLET_REPO_DEPTH:-$HAMLET_REPO_DEPTH_DEFAULT}
    export HAMLET_CLONE_ROOT="${HAMLET_CLONE_ROOT:-$HAMLET_CLONE_ROOT_DEFAULT}"

    echo $(curl -L "${HAMLET_REPO_CFG}") | jq  -r '.Repositories[] | "git clone --depth \(env.HAMLET_REPO_DEPTH) --branch \(env.HAMLET_REPO_BRANCH) \(.Repository) \(env.HAMLET_CLONE_ROOT)/\(.Directory)" ' | bash
else
    echo "Hamlet directory already exist."
fi